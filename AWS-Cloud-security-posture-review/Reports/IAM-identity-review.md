# IAM Identity & Access Policy Evaluation Ledger

This document records the systematic security evaluation of all discovered IAM identities, groupings, service roles, and attached access control policies within the cloud control plane.

## 1. Comprehensive Identity Governance Inventory

### 1.1 Identity Object: ROOT-01 (Root User Account)
*   **Why does it exist?** Primary tenant account creator identity required exclusively for structural account lifecycle changes, subscription adjustments, and emergency break-glass procedures [Observed].
*   **Access Classification:** Emergency Break-Glass Access [Observed].
*   **Is the owner known?** Yes; explicitly mapped to the corporate Account Owner [Simulated].
*   **Credential Type Enforced:** Long-lived master password stored in an encrypted vault [Assumed].
*   **Is MFA required?** Yes; hard-enforced via physical hardware security key [Observed].
*   **Are permissions broader than the task?** Yes; possesses implicit global administrative access (`*:*`) across all resources [Observed].
*   **Trust Policy Restrictions:** N/A (Global tenant root boundaries apply natively) [Tested].
*   **Is last-used information available?** Yes; credential report shows no activity within the current assessment window [Tested].
*   **Is the identity still needed?** Yes; mandatory architectural dependency for emergency recovery [Tested].
*   **Is review evidence current?** Yes; validated on August 29, 2026 [Tested].

### 1.2 Identity Object: ID-01 (User: AWS-accessor)
*   **Why does it exist?** Provisioned to act as a dedicated administrative identity to execute read-only cloud security posture reviews and compliance configuration audits [Observed].
*   **Access Classification:** Human Assessor / Auditor [Simulated].
*   **Is the owner known?** Yes; assigned strictly to the Cybersecurity Analyst [Simulated].
*   **Credential Type Enforced:** Long-lived static programmatic access key pair [Observed].
*   **Is MFA required?** Yes; virtual MFA device is actively registered for console operations [Observed].
*   **Are permissions broader than the task?** No; bounded explicitly to the read-only AWS-managed `SecurityAudit` policy baseline [Observed].
*   **Trust Policy Restrictions:** N/A (Standard user profile; no cross-account trust boundaries mapped) [Tested].
*   **Is last-used information available?** Yes; actively recording usage events under current terminal tracking sessions [Tested].
*   **Is the identity still needed?** Yes; required to complete ongoing security validation tasks [Tested].
*   **Is review evidence current?** Yes; verified via local `users.json` lookup on August 29, 2026 [Tested].

### 1.3 Identity Object: ROLE-01 (Role: AWSCloudTrail-Support)
*   **Why does it exist?** AWS service role generated to allow the CloudTrail log engine to securely write and ship system log payloads to CloudWatch storage buckets [Observed].
*   **Access Classification:** AWS Service Identity Workload [Observed].
*   **Is the owner known?** Yes; owned by the centralized Infrastructure Lead [Simulated].
*   **Credential Type Enforced:** Short-lived temporary session tokens generated automatically by the AWS Security Token Service (STS) [Assumed].
*   **Is MFA required?** No; interactive console login is impossible for this programmatic service principal [Tested].
*   **Are permissions broader than the task?** No; limited strictly to required `logs:PutLogEvents` and `logs:CreateLogStream` permissions [Observed].
*   **Trust Policy Restrictions:** Yes; restricted exclusively to the `://amazonaws.com` service principal under strict account string constraints [Tested].
*   **Is last-used information available?** Yes; monitored via automated CloudTrail generation tasks [Tested].
*   **Is the identity still needed?** Yes; critical infrastructure dependency for continuous auditing [Tested].
*   **Is review evidence current?** Yes; validated on August 29, 2026 [Tested].

---

## 2. Structural Policy and Group Evaluation Summary

*   **IAM Group Status:** Evaluation of `groups.json` reveals **zero local groups are configured**. Users are currently managed via direct inline or directly attached policies, which introduces an operational maintenance risk.
*   **Local Attached Policies Status:** Inspection of `local-attached-policies.json` shows **zero custom customer-managed policies exist**. The environment relies entirely on standard AWS-managed baselines (such as `SecurityAudit`), which reduces policy misconfiguration exposure but lacks fine-grained business logic restrictions.

## Evidence Mapping
- **Data Source Files:** `private-evidence/iam/users.json`, `private-evidence/iam/roles.json`
- **Evidence Label:** Tested
