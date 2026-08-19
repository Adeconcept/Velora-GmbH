# Access Request and Approval Standard

This standard defines the mandatory ticketing data, check validation steps, and decision authority rules for executing any privilege modifications outside default role bounds.

## Access Request Template

Every ad-hoc access modification must generate a tracking ticket containing this exact structure:

```text
# ACCESS REQUEST LOG

1. Request Details
- Request ID: [Auto-generated ticket number]
- Request Date: [YYYY-MM-DD]
- Requester Name: [Full Name]
- Identity ID: [USR-XXX / GST-XXX]
- Current Business Role: [RBAC Matrix String]
- Target System & Permission Requested: [Asset ID & Code]
- Justified Business Reason: [Detailed text block]
- Requested Activation Date: [YYYY-MM-DD]
- Requested Expiry / Review Date: [YYYY-MM-DD]
- Scope Elevation Check: Is access privileged, approval-capable, or restricted-data access? [Yes / No]
- Related Ticket or Change Management ID: [CM-XXX]

2. Required Verification Checks
- Does the RBAC matrix already allow this access as a birthright? [Yes / No]
- Is the Principle of Least Privilege applied to this requested scope? [Yes / No]
- Does the requested scope conflict with another active permission held by the user? [Yes / No]
- Is specialized security training, elevated MFA, compliant device, or explicit location gating required? [Yes / No]
- Is a time-limited or just-in-time (JIT) assignment possible for this task? [Yes / No]
- Is a formal corporate policy exception required? [Yes / No]

3. Approvals & Sign-Offs
- Line Manager Decision & Business Reason: [Approved / Denied + Text]
- System Owner Decision & Technical Reason: [Approved / Denied + Text]
- Security / IT Compliance Review (When Required): [Passed / Failed + Text]
- Provisioned By: [IT Support ID + Timestamp]
- Validated By: [Independent IT Auditor ID + Timestamp]

4. Closure Metrics
- Actual Permission Granted: [System String]
- Provisioning Log Reference Evidence: [Directory Event Hash]
- Technical Expiry Configured: [Yes / No / Not Supported]
- Scheduled Next Review Date: [YYYY-MM-DD]
```

## Mandatory Governance Decision Rules

* **Manager Jurisdiction:** Line managers can only confirm the underlying business need for a task; they cannot authorize technical rights to a resource they do not personally own.
* **System Owner Jurisdiction:** System owners hold exclusive authority to approve the actual technical permission strings or group additions for their assigned asset.
* **IT Self-Approval Ban:** IT personnel can implement authorized modifications but are strictly banned from self-approving their own privileged access changes or exception packages.
* **Hardcoded Expiry Enforcement:** All temporary access permissions must be configured with a technical, automated expiry constraint within the central directory wherever technically supported.
* **Matrix Deviations:** Any access granted outside the boundaries of the established RBAC matrix requires a formal corporate security policy exception containing a hardcoded expiry window and an explicit, documented compensating control.

