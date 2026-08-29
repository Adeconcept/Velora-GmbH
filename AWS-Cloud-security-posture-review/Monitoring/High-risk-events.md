# High-Risk Cloud Event Monitoring Catalog

This document defines the high-risk operational AWS API management events that require continuous detection engineering, alerting infrastructure coverage, and operational escalation parameters.

## 1. Priority 1 (P1) Alerts: Critical Control Plane Threats
*   **Root Account Activity (`ConsoleLogin`, Root API calls):** *Why it matters:* Indicates use of the highest account authority tier. *Expected Action:* Validate immediately via out-of-band channels and escalate unexpected activity to incident response rulesets.
*   **Logging Tampering (`StopLogging`, `DeleteTrail`, `UpdateTrail`):** *Why it matters:* Indicates an attempt to blind security monitoring or redirect audit trails. *Expected Action:* Confirm against an open change ticket; restore trail configurations immediately and preserve surrounding forensic evidence.
*   **Storage Exposure Changes (`PutBucketPolicy`, `DeleteBucketPolicy`, `PutBucketPublicAccessBlock`, `DeletePublicAccessBlock`):** *Why it matters:* Indicates that sensitive storage buckets or backups may become publicly or externally reachable over the internet. *Expected Action:* Run an immediate policy diff check and verify the public status of the targeted resource.
*   **Credential Mutations (`CreateAccessKey`, `UpdateAccessKey`, `DeleteAccessKey`):** *Why it matters:* Indicates that persistent, long-lived access credentials have been generated or modified. *Expected Action:* Validate the owner, operational purpose, key age, and request source parameters.
*   **Privilege Escalation Actions (`AttachUserPolicy`, `PutUserPolicy`, `CreatePolicyVersion`, `SetDefaultPolicyVersion`):** *Why it matters:* Indicates that user or component privileges are being expanded, creating unauthorized access vectors. *Expected Action:* Match the change details against an approved change order and check for least-privilege compliance.
*   **Trust Relationship Alterations (`UpdateAssumeRolePolicy`):** *Why it matters:* Indicates that a new, untrusted external principal may have been granted access to assume a local privileged role. *Expected Action:* Perform an immediate trust policy diff check and verify condition boundaries.
*   **Cryptographic Disruptions (`DisableKey`, `ScheduleKeyDeletion`):** *Why it matters:* Indicates that encrypted data storage tiers, backups, or forensic logs may become completely permanently inaccessible. *Expected Action:* Validate formal approval records and assess recovery impact before key deletion windows close.

## 2. Priority 2 (P2) Alerts: Operational Security Anomalies
*   **Network Perimeter Expansion (`AuthorizeSecurityGroupIngress`):** *Why it matters:* Indicates that local network attack surfaces are increasing via open ingress ports. *Expected Action:* Review the source IP constraints, allowed ports, destination asset criticality, and rule expiration windows.
*   **Compute Sprawl or Identity Ingestion (`RunInstances`, `CreateFunction`, `CreateUser`):** *Why it matters:* Indicates that new, untrusted compute engines or user accounts are active, raising risks of cost overruns or credential abuse. *Expected Action:* Validate resource owners, verify asset tags, and check compliance guardrails.
*   **Brute-Force Indicators (Repeated failed console sign-in attempts):** *Why it matters:* Indicates an active credential password-spraying attack or an internal user identity configuration issue. *Expected Action:* Correlate identity trends, trace source IP indicators, and check timing metrics.

---

## 3. Tooling and Documentation Attestation
Event identifiers listed within this catalog serve as standard behavioral triggers. Production-ready security teams must continuously cross-reference the active **AWS CloudTrail User Guide API Reference** documentation to confirm changes to event naming conventions and service logging outputs.

