# Joiner, Mover, and Leaver (JML) Identity Workflows

This document establishes the operational timelines, tracking artifacts, and definitive success criteria for managing user lifecycle events.

## 1. Joiner Workflow (Onboarding Architecture)

| When | Action | Operational Owner | Required Evidence | Binary Success Measure |
| :--- | :--- | :--- | :--- | :--- |
| **T-5 Days** | HR creates a complete joiner event with role, manager, start date, and physical location. | Head of People | Personio HR Event ID | All mandatory user identity telemetry fields are complete. |
| **T-4 Days** | Hiring manager selects an approved role mapping straight from the RBAC matrix. | Hiring Manager | Signed Role Selection Form | Zero free-text privilege parameters are permitted unless an exception is logged. |
| **T-3 Days** | System owner formally reviews and approves any privileged or sensitive access exceptions. | System Owner | Exception Approval ID with hardcoded expiry | Every exception has a documented business reason and fixed end date. |
| **T-1 Day** | IT provisions the central account in a disabled state, maps security groups, and prepares hardware. | IT Support | Active Provisioning Checklist | Initial account permissions match the approved RBAC target layout perfectly. |
| **First Sign-In** | User completes mandatory registration for corporate MFA before accessing internal tools. | User & IT Support | MFA Registration Status Log | Central Conditional Access enforcement passes without bypasses. |
| **Day 1** | Manager verifies and confirms that actual system permissions match the role layout. | Hiring Manager | Signed Day 1 Confirmation | Necessary access functions correctly; unapproved or shadow access is absent. |
| **Day 5** | IT audits provisioning logs for failed synchronization tasks and formally closes the record. | IT Support | Completed Ticket Closure Log | Zero unresolved or orphaned provisioning tasks remain active in the directory. |

## 2. Mover Workflow (Role Transition Architecture)

| When | Action | Operational Owner | Required Evidence | Binary Success Measure |
| :--- | :--- | :--- | :--- | :--- |
| **Pre-Effective** | HR records new role parameters, department adjustments, updated manager, and start date. | Head of People | Personio Mover Event Log | Former and incoming business roles are clearly identifiable. |
| **Same Day** | IT executes a comparative delta analysis between current access and the target RBAC profile. | IT Support | Access Difference Report | Complete delta delta-list of add, remove, and review items is compiled. |
| **Pre-Grant** | System owner reviews the target profile for potential standing privilege or SoD conflicts. | System Owner | Signed Risk Sign-off or Denial | All identified separation-of-duties conflicts are resolved before granting access. |
| **Effective Date** | IT removes former-role access groups and provisions newly approved permissions. | IT Support | Tenant Administrative Change Log | All legacy role permissions are completely purged within 1 business day. |
| **Within 5 Days** | The incoming manager runs an independent verification audit on the employee’s actual workspace access. | New Manager | Signed Post-Mover Attestation | System access strictly matches the updated functional responsibility boundaries. |

## 3. Leaver Workflow (Offboarding Hardening)

| Timing | Action | Operational Owner | Required Evidence | Binary Success Measure |
| :--- | :--- | :--- | :--- | :--- |
| **Immediate** | Terminate and disable the central workforce identity account instantly. | IT Support | Directory Audit Event Log | Active interactive sign-in paths are blocked on time. |
| **Simultaneous** | Revoke all active authentication tokens, browser sessions, and security methods. | IT Support | Token Revocation Token Result | Existing sessions are invalidated instantly across all connected endpoints. |
| **Within 1 Hour** | Strip permanent privileged roles, clear security group memberships, and block remote access. | IT Manager | Privilege Removal Activity Log | Zero active privileged entry paths or standing roles remain in the directory. |
| **Same Day** | Transfer owned files, mailboxes, tickets, repositories, and workflows to an approved internal owner. | Manager & System Owners | Asset Transfer Checklist | Critical corporate data holdings and business workloads remain owned. |
| **Same Day** | Manually remove or disable access profiles across all non-federated SaaS apps and platforms. | System Owners | Downstream App Confirmation | Every single un-federated tool is confirmed checked and cleared. |
| **Within 1 Day** | Perform an independent audit validating the leaver checklist against the original HR database event. | IT Manager | Independent Reconciliation Log | Zero open lifecycle removal tasks or dangling permissions remain active. |
| **Per Retention** | Retain or delete underlying business data pools strictly according to corporate data policies. | Data Owner | Signed Retention Action Log | No invented or unauthorized data retention periods are executed. |

> [!WARNING]
> **Operational Warning:** A disabled Microsoft Entra account does not prove that every independent SaaS session, API token, local account, SSH key, or service credential has been removed. The leaver checklist must explicitly cover each in-scope system and owned credential.

