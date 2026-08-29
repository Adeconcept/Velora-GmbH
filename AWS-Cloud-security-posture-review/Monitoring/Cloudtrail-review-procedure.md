# CloudTrail High-Risk Event Review Procedure

## Purpose
Provide a repeatable review of high-risk AWS management activity affecting identity, logging, storage, encryption, network exposure, and resource creation.

## Frequency
- **P1 alert:** Immediate triage when automated monitoring exists.
- **P1 manual fallback:** Review each business day.
- **P2:** Review weekly or after a change window.
- **Coverage review:** Monthly and after architecture changes.

## Inputs
- CloudTrail Event history for recent regional management events
- Ongoing multi-Region trail where configured
- CloudWatch or SIEM alerts where configured
- Approved change records
- IAM and resource ownership inventory

## Triage steps
1. Confirm event name, time, Region, actor type, source, target, and outcome.
2. Determine whether the event was read-only or changed state.
3. Compare it to an approved change or expected administrative activity.
4. Assess affected asset, data, access path, persistence, and business impact.
5. Search for related identity, policy, logging, and resource events.
6. Preserve evidence without modifying the source.
7. Classify as Authorized, Benign but Unapproved, Suspicious, Confirmed Incident, or Inconclusive.
8. Escalate based on priority and evidence.
9. Record owner, action, timestamp, and closure evidence.

## Escalation
- **Unexpected root activity:** Immediate escalation to IT Manager and CTO.
- **Logging stopped or trail deleted:** Immediate escalation and evidence preservation.
- **Public S3 access change involving Restricted data:** Immediate incident assessment.
- **Unauthorized policy or access-key change:** Disable or contain only through approved incident authority.

## Evidence privacy
Raw events remain in approved storage. Portfolio examples remove identities, account IDs, ARNs, IP addresses, resource names, session data, and request parameters.

