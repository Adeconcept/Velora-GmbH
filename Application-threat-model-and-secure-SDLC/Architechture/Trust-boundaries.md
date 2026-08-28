# Trust Boundary Matrix & Operational Risks

This document establishes the security profiles, change-in-trust parameters, structural threats, and defensive controls applied across the Velora Customer Web Application trust boundaries.

| Boundary | Change in Trust | Main Risk Questions | Minimum Controls | Label |
| :--- | :--- | :--- | :--- | :--- |
| **TB0 Public internet to P1** | Anonymous and untrusted traffic enters Velora-controlled edge | Can requests be spoofed, tampered with, replayed, or exhausted? | TLS, request limits, input limits, WAF as defense in depth, safe error handling | Recommended |
| **TB1 Edge to application** | Filtered traffic reaches business logic | Does the application still validate identity, authorization, input, and workflow state? | Server-side validation, authorization, rate limits, secure session handling | Recommended |
| **TB1 Application to database** | Application identity accesses Restricted data | Can a query be injected or the service read excessive data? | Parameterized queries, least privilege, encryption, monitoring | Recommended |
| **TB2 Stripe to application** | Vendor message changes order state | Is the event genuine, recent, unique, and linked to the right order? | Signature, timestamp, replay prevention, idempotency, server-side reconciliation | Recommended |
| **TB2 Entra to application** | External identity claims influence privileged access | Are issuer, audience, signature, expiry, claims, and local authorization validated? | Standard OIDC validation, MFA policy, local role checks | Recommended |
| **GitHub to application** | Reviewed source becomes running software | Can source, dependency, secret, or pipeline state be changed without approval? | Protected branches, review, signed or attested build, secret scanning, least privilege | Recommended |
| **Logs to hosted Splunk** | Security evidence leaves application control | Can events be lost, altered, exposed, or ignored? | Authenticated forwarding, restricted access, time sync, alerting, retention | Recommended |

