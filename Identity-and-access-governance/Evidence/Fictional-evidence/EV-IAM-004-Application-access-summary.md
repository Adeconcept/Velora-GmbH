# EV-IAM-004: Application Access Summary

## Evidence label
Simulated

## Important conditions
* **Unrevoked Permissions:** A Finance mover retains full Zendesk Administrator access from their former Support role.
* **Separation-of-Duties Conflict:** A Finance Analyst has both refund-approval and finance-approval capabilities active simultaneously.
* **Interactive Threat Vector:** Two non-human service identities permit interactive browser sign-in.
* **Missing Accountability:** One service identity has no named internal human owner.
* **Stale Accounts:** One active Engineer account and several non-workforce identities meet the 45-day stale threshold without a sign-in event.

## Review use
Supports role comparison, separation-of-duties (SoD) enforcement, service-account hardening, and stale-account tests.

## Limitation
The permissions are fictional and do not describe real Microsoft, AWS, GitHub, Stripe, Zendesk, or Personio configurations.

