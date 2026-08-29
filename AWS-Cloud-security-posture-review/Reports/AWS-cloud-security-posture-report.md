# AWS Cloud Security Posture Assessment Report

This report documents the architectural security posture review, technical vulnerabilities, risk scoring evaluations, and developer-ready remediation blueprints compiled for Velora Commerce GmbH's cloud infrastructure footprint.

## AWS-SEC-001: Long-Lived Programmatic IAM Access Keys

### Severity
High (Risk Score: 15 / Formula: $3 \times 5$)

### Affected Resource
- **Resource Alias:** `ID-01`
- **Asset ID:** AST-003 (AWS Production Account Envelope)
- **Data Classification:** Restricted
- **Business Purpose:** Dedicated administrative identity used to execute read-only cloud security posture reviews.

### Observation
The security review of the user management configuration (`private-evidence/iam/users.json`) and the identity credential report (`private-evidence/iam/credential-report.csv`) confirmed that user `AWS-accessor` utilizes a permanent, long-lived programmatic access key pair to execute infrastructure API calls from a local workstation.

### Evidence
- **Source:** `private-evidence/iam/users.json`, `private-evidence/iam/credential-report.csv`
- **Review Date:** 2026-08-29
- **Evidence Label:** Tested / Observed technical state from an authorized learning account.
- **Sanitized Reference:** `User: arn:aws:iam::052081695808:user/AWS-accessor / AccessKeyId: AKIAXXXXXXXXXXXXXXXX`

### Risk Scenario
A malicious actor could compromise the analyst's local development machine or intercept un-ignored configuration files to steal the plaintext programmatic access key strings. This would grant the attacker persistent, unauthorized API access to the cloud environment, letting them scan configurations, map out assets, and locate entry points.

### Existing Controls
- Virtual Multi-Factor Authentication (MFA) is actively required and enforced for all interactive web console login sessions.
- The user account permissions are restricted to the read-only AWS-managed `SecurityAudit` policy, preventing the keys from being used to delete infrastructure or exfiltrate data volumes directly.

### Recommendation
1. **Immediate Safe Action:** Validate that the active keys are held strictly by the authorized analyst, and verify that no unauthorized API requests have originated from the key ID.
2. **Durable Control:** Migrate the administrative review profile from static IAM user keys to **AWS IAM Identity Center temporary federated sessions** using the short-lived CLI profile configuration wrapper (`aws configure sso`). Once federation is active, deactivate, delete, and purge the permanent access key strings from the user profile.
3. **Ownership and Review:** The IT Admin assumes operational ownership of the identity migration, which must be verified against quarterly credential lifecycle audits.

### Change Safety
- **Dependency Check:** Confirm that no continuous background automated cron scripts or infrastructure-as-code deployment engines depend on this specific user's access keys.
- **Backup or Recovery Consideration:** Ensure the local workstation maintains access to the AWS console via browser session MFA so access isn't lost if keys are deactivated midway.
- **Rollback Plan:** If temporary federated credentials experience connection errors, temporarily re-enable the programmatic access keys for a 24-hour troubleshooting window.
- **Cost Consideration:** Transitioning to AWS IAM Identity Center is a core security control that incurs **zero extra service costs**.

### Verification
The finding will be moved to Closed when an updated `credential-report.csv` file confirms that the `access_key_1_active` and `access_key_2_active` status flags for user `AWS-accessor` evaluate as `false` or completely empty.

### Status
Open

---

## AWS-SEC-002: Missing Account-Level Access Analyzer

### Severity
Medium (Risk Score: 8 / Formula: $2 \times 4$)

### Affected Resource
- **Resource Alias:** `IAM-01`
- **Asset ID:** AST-003 (AWS Production Account Envelope)
- **Data Classification:** Restricted
- **Business Purpose:** Central global identity and access management service plane.

### Observation
Querying the active threat monitoring analyzer infrastructure (`private-evidence/iam/access-analyzers.json`) confirmed that no account-level external-access analyzer is active in our primary operating region (`eu-central-1`). The returned JSON payload array evaluates as completely empty (`[]`).

### Evidence
- **Source:** `private-evidence/iam/access-analyzers.json`
- **Review Date:** 2026-08-29
- **Evidence Label:** Tested / Observed technical state from an authorized learning account.
- **Sanitized Reference:** `aws accessanalyzer list-analyzers --type ACCOUNT --> []`

### Risk Scenario
An internal administrator could accidentally apply a loose resource policy or attach a misconfigured cross-account IAM trust role to an internal repository or backup stream. Without an active analyzer, this unintended external sharing could remain completely unidentified for weeks, letting unauthorized outside tenants read confidential business records over the network.

### Existing Controls
- The Global S3 Account Public Access Block is fully enabled (`True` across all four parameters), which acts as a hard centralized safeguard blocking public internet exposure of local object data stores.

### Recommendation
1. **Immediate Safe Action:** Manually review all existing IAM role trust relationships to ensure no unauthorized external account IDs are mapped as trusted principals.
2. **Durable Control:** Provision and enable a native **AWS IAM External-Access Analyzer** scoped to the entire Account organization perimeter within region `eu-central-1` to continuously monitor cross-account policies.
3. **Ownership and Review:** The Security Lead assumes ownership of the monitoring engine. The analyzer's active finding logs must be reviewed weekly.

### Change Safety
- **Dependency Check:** Activating an external access analyzer is a passive, read-only monitoring configuration that introduces zero structural changes or service dependency breaks.
- **Backup or Recovery Consideration:** N/A (Does not alter data or impact service availability).
- **Rollback Plan:** The analyzer can be deleted instantly via the CLI without impacting surrounding computing workloads.
- **Cost Consideration:** Standard External-Access Analyzer capabilities are included at **zero extra cost** within the AWS Free Tier. *Warning:* Do not enable premium "Unused-Access Analysis" features without an approved cost decision, as they incur recurring per-identity monthly fees.

### Verification
The finding will be closed when a local `access-analyzers.json` log dump confirms that an active analyzer exists with a `status` flag reading `ACTIVE` and `type` matching `ACCOUNT`.

### Status
Open

---

## AWS-SEC-003: Missing Multi-Region CloudTrail Trail

### Severity
High (Risk Score: 16 / Formula: $4 \times 4$)

### Affected Resource
- **Resource Alias:** `CT-01`
- **Asset ID:** AST-013 (AWS CloudTrail Logging Infrastructure)
- **Data Classification:** Confidential
- **Business Purpose:** Core platform governance logging engine managing infrastructure activity data.

### Observation
Querying the logging infrastructure (`private-evidence/cloudtrail/trails.json`) confirmed that the `trailList` block is completely empty (`[]`). The environment contains zero persistent long-term multi-region trails, relying solely on default console Event History.

### Evidence
- **Source:** `private-evidence/cloudtrail/trails.json`
- **Review Date:** 2026-08-29
- **Evidence Label:** Tested / Observed technical state from an authorized learning account.
- **Sanitized Reference:** `{ "trailList": [] }`

### Risk Scenario
An advanced persistent threat actor could compromise an identity within the tenant and execute stealthy infrastructure changes, network modifications, or data access operations. Because default Event History only maintains a rolling 90-day regional log window without log file encryption or tamper-resistance signatures, the attacker's forensic tracks would completely disappear after 90 days. This would prevent the incident response team from running historical investigations or proving non-repudiation during a post-breach audit.

### Existing Controls
- Standard AWS 90-day regional Event History remains enabled natively on the console plane, capturing basic read-only and write management events.

### Recommendation
1. **Immediate Safe Action:** Manually review the last 30 days of regional management events via the console to look for unexpected configuration or infrastructure changes.
2. **Durable Control:** Design and deploy a single, account-level, **Multi-Region CloudTrail Trail** configured with global service events tracking and **Log File Validation enabled** (`true`). Route the log streams into a dedicated, encrypted S3 bucket protected by strict lifecycle retention rules.
3. **Infrastructure-Lead** assumes operational ownership of the logging pipeline, while the Security Lead manages long-term log retention and SIEM integration.

### Change Safety
- **Dependency Check:** Enabling a new trail is a non-disruptive, additive auditing configuration that introduces zero downtime or performance latency risks to running applications.
- **Backup or Recovery Consideration:** Ensure the target destination log bucket is newly provisioned and separate from existing business application data channels.
- **Rollback Plan:** Turn off logging using the `stop-logging` command if storage costs expand unexpectedly.
- **Cost Consideration:** AWS provides the first copy of management events delivered to an S3 bucket at **zero service cost**. *Cost Guardrail:* To prevent high storage bills, explicitly leave data events (such as S3 object-level logs) **disabled** until an approved executive budget allocation is signed off.

### Verification
The finding will be closed when a local `trails.json` metadata dump confirms that a trail is present with `IsMultiRegionTrail` and `LogFileValidationEnabled` parameters both evaluating as `true`.

### Status
Open

---

## AWS-SEC-004: Missing High-Risk Event Alerting Matrix

### Severity
High (Risk Score: 12 / Formula: $3 \times 4$)

### Affected Resource
- **Resource Alias:** `CT-01`
- **Asset ID:** AST-014 (Hosted Splunk SIEM Ingestion Destination)
- **Data Classification:** Confidential
- **Business Purpose:** Central security operations monitoring dashboard managing real-time threat detection.

### Observation
A manual review of the environment's monitoring configuration confirmed that no automated alerts, repeatable notification triggers, or manual review procedures are active to flag high-risk management changes. Security and administrative events remain completely un-monitored unless an analyst manually queries the logs.

### Evidence
- **Source:** Console-Review / Monitoring Architecture Audit
- **Review Date:** 2026-08-29
- **Evidence Label:** Observed / Mapped to Simulated Velora business impact.
- **Sanitized Reference:** No Amazon SNS topics, CloudWatch metric filters, or Splunk alerting rules are mapped to administrative API events.

### Risk Scenario
A threat actor or rogue employee could compromise an identity and execute critical control-plane mutations—such as creating permanent access keys, attaching administrative policies to standard users, or deleting security trails. Because there are no real-time alerting triggers or structured review cadences, these dangerous changes would go completely unnoticed, letting the attacker expand their privileges and maintain persistence indefinitely.

### Existing Controls
None. Infrastructure changes depend entirely on manual, ad-hoc log searches during an active investigation or incident triage window.

### Recommendation
1. **Immediate Safe Action:** Establish a temporary manual fallback review cadence where a security analyst manually reviews the primary region's management logs at the close of each business day.
2. **Durable Control:** Implement a prioritized high-risk event alert matrix within your log aggregator or SIEM (Hosted Splunk). Configure immediate alerts for critical P1 events, including Root console logins, `StopLogging` calls, `PutBucketPolicy` updates, and `CreateAccessKey` actions.
3. **Ownership and Review:** The Security Lead assumes ownership of detection engineering and alert tuning. Incident response playbooks must be written to handle each alert category within defined SLA response windows.

### Change Safety
- **Dependency Check:** Alerting and monitoring architectures run out-of-band and introduce zero downtime risks to live production systems.
- **Backup or Recovery Consideration:** N/A (Does not modify or delete active infrastructure assets).
- **Rollback Plan:** Alerting parameters can be paused or tuned down inside the SIEM console to prevent alert fatigue if false positives spike.
- **Cost Consideration:** CloudWatch metrics and SIEM alerts incur variable data-volume ingestion fees. The rules must be tightly bounded to monitor only specific P1/P2 management event names to keep costs low.

### Verification
The finding will be closed when a non-destructive test event (such as an authorized, simulated read-only policy check) successfully triggers an automated security notification that reaches the designated security owner within SLA thresholds.

### Status
Open
