# Role Design and Core RBAC Governance Rules

This document establishes the architecture for Role-Based Access Control (RBAC) and sets the baseline security principles governing the creation, modification, and exception handling of corporate identity permissions.

## Permission Codes Definition

The following codes quantify technical capabilities across the Velora Commerce GmbH identity workspace:

| Code | Meaning | Functional Boundary |
| :--- | :--- | :--- |
| **0** | No access | The identity possesses zero directory group alignment, role, or access path. |
| **U** | Standard user | Standard user birthright permissions required for routine non-administrative tasks. |
| **R** | Read-only | Read or view capability without modification or structural extraction privileges. |
| **W** | Create or update | Write, create, or modify files or records without final executive approval authority. |
| **A** | Business approval | Authorized business approval authority for financial transactions or system modifications. |
| **P** | Privileged admin | Full structural or administrative privileges to configure, delete, or manage software/infrastructure. |
| **S** | Service-only | Non-interactive machine-to-machine application integration or API token access. |
| **C** | Case-specific | Time-limited, justified access requiring active system-owner approval before each session. |

## Role Design Rules of Engagement

To satisfy NIST CSF v2.0 (PR.AA-05) and CIS Controls v8.1 (Control 5), all identity management operations must strictly execute against these eight logical boundaries:

1. **Birthright Access Hardening:** Birthright access must be strictly limited to the absolute minimum baseline of technical privileges required by every single member assigned to that business role.
2. **System-Owner Authorization Boundary:** Any access scope labeled as sensitive (R/W tracking or processing restricted data) or privileged (P) explicitly requires the system owner's recorded approval before provisioning.
3. **Mover Clean-Sweep Rule:** A corporate mover must have their former-role access privileges stripped completely before, or at the exact effective timestamp of, the new role permissions becoming active.
4. **Guest Identity Constraints:** All guest profiles must map to a named internal company sponsor and maintain a hardcoded, non-negotiable target termination end date.
5. **Service Identity Data Minimization:** Non-human service identities are restricted to integration-specific, non-interactive execution scopes. They are barred from accumulating standard user groups.
6. **Separation of Duties (SoD) Enforcement:** Conflicting create-and-approve permissions (such as possessing both file creation 'W' and transaction final approval 'A' within the same financial workflow) require distinct separation or a documented compensating review process.
7. **Privileged Account Segregation:** Privileged administrative profiles must remain separate from ordinary daily communication accounts (such as standard email and web browsing) and utilize time-limited, just-in-time (JIT) elevation where technically supported.
8. **Exception Logging Criteria:** Every single deviation or access matrix exception must map to a named human owner, state an explicit business reason, document a hardcoded expiry window, and set a fixed review date.

