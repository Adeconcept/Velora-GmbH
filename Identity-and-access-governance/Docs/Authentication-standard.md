# Corporate Authentication Standard

This document establishes the technical configuration requirements, protocol constraints, and verification milestones governing enterprise-wide authentication controls.

## Authentication Requirement Matrix

| Control Area | Mandatory Configuration Requirement | Compliance Verification Evidence |
| :--- | :--- | :--- |
| **Workforce MFA** | 100% of human workforce identities require centrally enforced, non-bypassable Multi-Factor Authentication for all system access. | Entra ID Conditional Access configuration policy dumps and tenant-wide MFA coverage exports. |
| **Privileged MFA** | Privileged administrative users require hardware-based, phishing-resistant authentication controls (FIDO2/WebAuthn keys) where supported. | Entra authentication-strength policy properties and administrative registration log files. |
| **Legacy Authentication** | Explicitly block legacy, basic-authentication protocols (e.g., IMAP, POP3, SMTP AUTH) that cannot enforce modern multi-factor prompts. | Global tenant authentication policy configurations and interactive sign-in failure log checks. |
| **Rollout Safety** | Test all identity and authentication policies using "Report-Only" or phased pilot modes; define monitored exceptions and protect emergency recovery paths. | Policy test reports, monitored exception listings, and a formally archived emergency rollback plan. |
| **Passwords** | Permit long passphrases (up to 128 characters), screen entries against compromised string databases, eliminate arbitrary complexity composition rules, and do not force periodic rotation without evidence of compromise. | Central active directory configuration strings and help-desk account reset procedure logs. |
| **Recovery** | Perform positive out-of-band identity verification before resetting password credentials or replacing a registered authenticator token. | Completed user recovery checklists and matching directory administrative audit events. |
| **Session Revocation** | Force instant, tenant-wide session token revocation for offboarded leavers, confirmed identity compromises, and high-risk administrative response tasks. | Global session invalidation command strings and tenant token clearing audit trail evidence. |
| **Guest Authentication** | Mandate appropriate MFA assurance levels for external guest profiles and subject accounts to continuous, recurring internal sponsor reviews. | Guest conditional access rule definitions and quarterly sponsor attestation result sheets. |
| **Service Identities** | Do not treat non-human service accounts as human MFA subjects; enforce non-interactive workload identity parameters, certificate-based credentials, and managed identity controls. | Workload identity access logs, cryptographic certificate metadata records, and interactive web sign-in block event logs. |

