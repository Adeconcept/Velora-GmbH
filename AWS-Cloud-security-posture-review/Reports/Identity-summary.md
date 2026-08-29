# Identity Governance Summary

This document provides a sanitized structural review of the identities, authentication states, and credential lifecycles configured within the evaluated AWS cloud domain.

| Identity Alias | Credential Type | Console Access Policy | Multi-Factor Status | Programmatic Access keys | Last-Use Lifecycle Review | Assessment Decision |
| :--- | :--- | :--- | :--- | :---: | :--- | :---: |
| **ROOT-01** | Root User Account | Emergency Break-Glass Only | **Enabled** (Hardware Key) | 0 | Reviewed (No activity recorded) | **Pass** |
| **ID-01** | AWS-accessor (IAM User) | Disabled | **Enabled** Authenticator | 1 (Active) | Active audit session use | **Failed** (Long-Lived Keys) |
| **ROLE-01** | SecurityAudit (Service Role) | Temporary Session | Enforced by IAM Control | 0 | Automated system validation | **Pass** |

---

## Identity Assessment Insights

1. **Root Account Hardening (`ROOT-01`):** The primary root account is properly locked down. It has multi-factor authentication securely active, zero long-lived programmatic access keys generated, and shows zero recent operational log trails, proving it is strictly reserved for emergency break-glass scenarios.
2. **Credential Risk Exposure (`ID-01`):** While user `AWS-accessor` has successfully enabled a virtual MFA token, the account relies on two active **long-lived programmatic access keys** stored on a local machine to run CLI actions. This configuration introduces a structural security gap and fails the temporary-session access check.
3. **Role Isolation (`ROLE-01`):** Automated infrastructure services and cross-account auditing tracks successfully inherit short-lived, automated sessions using standard read-only permission sets, enforcing strong least-privilege guardrails.

## Evidence Mapping
- **Raw Evidence Source:** `private-evidence/iam/credential-report.csv` (Stored locally, excluded from repository commits)
- **Review Date:** 2026-08-29
- **Evidence Label:** Tested
