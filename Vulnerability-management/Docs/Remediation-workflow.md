# Velora Commerce GmbH Vulnerability Remediation Workflow

This document establishes the standardized, safe operational workflow for implementing security updates and structural configuration changes across Velora infrastructure assets. It enforces defensive engineering checks to prevent service disruptions while ensuring full alignment with our risk governance targets.

## 1. 12-Stage Structural Remediation Lifecycle

Every security modification must proceed through these precise operational milestones:
1. **Confirm finding**: Validate that the scanner deduction is legitimate and maps to local asset telemetry.
2. **Select action**: Identify the ideal mitigation path (Patch, Reconfigure, Remove, Isolate, Upgrade, or Accept).
3. **Assign owner**: Designate a technical custodian responsible for executing the change.
4. **Assess operational risk**: Evaluate potential downtime, dependency conflicts, or configuration blocks.
5. **Snapshot or backup**: Capture a restorable image or file archive before touching the system state.
6. **Define test and rollback**: Establish deterministic pass/fail parameters and a recovery plan.
7. **Approve change**: Secure authorization from the platform owner or engineering lead.
8. **Implement**: Execute precise terminal commands or drop-in settings updates.
9. **Validate service**: Run operational status validations to verify application uptime.
10. **Rescan**: Run a targeted credentialed scan using identical profiles to verify vulnerability clearance.
11. **Reassess risk**: Confirm residual tracking posture or handle outstanding regression issues.
12. **Close or reopen**: Move the tracking status to closed upon a successful rescan, or reopen the ticket on failure.

## 2. Action Classification Options Matrix

| Action | When to Use | Structural Example |
| :--- | :--- | :--- |
| **Patch** | A vendor-supported package update explicitly eliminates the vulnerability. | Run `sudo apt install --only-upgrade openssh-server`. |
| **Reconfigure** | The software is modern but insecure default configuration settings expose a flaw. | Modify configuration attributes to enforce `PasswordAuthentication no`. |
| **Remove** | The flagged background daemon, utility, or open network port serves no current business or operational need. | Execute `sudo systemctl disable --now apache2`. |
| **Isolate** | A direct fix is unavailable, too disruptive, or a production patch must be delayed. | Apply netfilter firewall boundaries to drop traffic or restrict source paths. |
| **Upgrade/Replace**| The underlying software or OS distribution branch has reached its official End-of-Life (EOL). | Migrate from old EOL components to a long-term support distribution branch. |
| **Accept Temporarily**| Fixes are deferred by the business risk owner for an explicitly approved timeline. | Record a formal entry in the risk register with fixed expiry dates. |
| **False Positive** | Concrete engineering evidence proves the scanning engine's detection logic is wrong. | Prove an backported upstream package release has neutralized the target CVE. |

