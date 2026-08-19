param(
    [string]$InputPath = "..\registers\identity-review-sample.csv",
    [string]$OutputPath = "..\registers\access-review-results.csv",
    [datetime]$ReferenceDate = "2026-08-24",
    [int]$StaleDays = 45
)

$ErrorActionPreference = "Stop"
$identities = Import-Csv -Path $InputPath
$results = New-Object System.Collections.Generic.List[object]
$counter = 1

function Add-ReviewResult {
    param(
        [string]$IdentityID,
        [string]$UPN,
        [string]$TestID,
        [string]$Expected,
        [string]$Actual,
        [string]$Decision,
        [string]$Severity,
        [string]$RelatedRisk,
        [string]$DueDate
    )

    $script:results.Add([pscustomobject]@{
        Review_ID       = "AR-{0:D3}" -f $script:counter
        Identity_ID     = $IdentityID
        UPN             = $UPN
        Test_ID         = $TestID
        Expected_State  = $Expected
        Actual_State    = $Actual
        Decision        = $Decision
        Severity        = $Severity
        Reviewer        = "IAM Analyst, simulated"
        Decision_Date   = $script:ReferenceDate.ToString("yyyy-MM-dd")
        Due_Date        = $DueDate
        Related_Risk    = $RelatedRisk
        Status          = "Open"
        Evidence_Label  = "Tested against simulated data"
    })
    $script:counter++
}

foreach ($identity in $identities) {
    # IAM-T01: Enabled Leaver
    if ($identity.Identity_Type -eq "Workforce" -and
        $identity.Employment_Status -eq "Departed" -and
        $identity.Account_Status -eq "Enabled") {
        Add-ReviewResult $identity.Identity_ID $identity.UPN "IAM-T01" "Departed account disabled" "Account enabled" "Disable" "Critical" "R-002" "2026-08-24"
    }

    # IAM-T02: Workforce MFA Missing
    if ($identity.Identity_Type -eq "Workforce" -and
        $identity.Employment_Status -eq "Active" -and
        $identity.MFA_Status -ne "Enforced") {
        Add-ReviewResult $identity.Identity_ID $identity.UPN "IAM-T02" "MFA centrally enforced" $identity.MFA_Status "Modify" "High" "R-001" "2026-09-15"
    }

    # IAM-T03: Expired Enabled Guest
    if ($identity.Identity_Type -eq "Guest" -and
        $identity.Account_Status -eq "Enabled" -and
        -not [string]::IsNullOrWhiteSpace($identity.Access_End_Date) -and
        [datetime]$identity.Access_End_Date -lt $ReferenceDate) {
        Add-ReviewResult $identity.Identity_ID $identity.UPN "IAM-T03" "Future access end date or disabled" "Expired $($identity.Access_End_Date), still enabled" "Remove" "High" "R-002" "2026-08-24"
    }

    # IAM-T04: Ownerless Service Identity
    if ($identity.Identity_Type -eq "Service" -and
        [string]::IsNullOrWhiteSpace($identity.Owner)) {
        Add-ReviewResult $identity.Identity_ID $identity.UPN "IAM-T04" "Named business and technical owner" "Owner blank" "Escalate" "High" "R-002" "2026-08-31"
    }

    # IAM-T05: Interactive Service Identity Allowed
    if ($identity.Identity_Type -eq "Service" -and
        $identity.Interactive_SignIn -eq "Allowed") {
        Add-ReviewResult $identity.Identity_ID $identity.UPN "IAM-T05" "Interactive sign-in blocked" "Interactive sign-in allowed" "Modify" "High" "R-002" "2026-08-31"
    }

    # IAM-T06: Stale Identity (>45 Days)
    if ($identity.Account_Status -eq "Enabled" -and
        -not [string]::IsNullOrWhiteSpace($identity.Last_SignIn)) {
        $lastSignIn = [datetime]$identity.Last_SignIn
        if ($lastSignIn -lt $ReferenceDate.AddDays(-$StaleDays)) {
            Add-ReviewResult $identity.Identity_ID $identity.UPN "IAM-T06" "Sign-in within $StaleDays days or approved exception" "Last sign-in $($identity.Last_SignIn)" "Escalate" "Medium" "R-002" "2026-09-07"
        }
    }

    # IAM-T07: Privileged Review Missing
    if ($identity.Identity_Type -eq "Workforce" -and
        $identity.Employment_Status -eq "Active" -and
        $identity.Privilege_Level -eq "Privileged" -and
        [string]::IsNullOrWhiteSpace($identity.Last_Access_Review)) {
        Add-ReviewResult $identity.Identity_ID $identity.UPN "IAM-T07" "Privileged review within 90 days" "No review date" "Escalate" "High" "R-002" "2026-09-07"
    }
}

$results | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8

Write-Host "Reviewed $($identities.Count) identities."
Write-Host "Created $($results.Count) automated exception rows."
Write-Host "Output: $OutputPath"

