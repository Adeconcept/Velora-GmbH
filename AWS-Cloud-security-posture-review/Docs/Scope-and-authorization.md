# Scope and Authorization

## Objective
Assess the security posture of an authorized AWS learning account, focusing on account safeguards, identity and access management, S3 protection, CloudTrail logging, monitoring readiness, and cost controls.

---

## Authorization
The account is owned by the analyst or explicitly authorized for this review. Testing is limited to read-only configuration inspection, offline policy validation, and approved defensive changes.

---

## In scope
- Account and root-user safeguards
- Billing alert and cost-control posture
- IAM users, roles, groups, policies, credentials, MFA status, and access review indicators
- IAM Access Analyzer policy validation
- Existing S3 bucket security configuration
- CloudTrail Event history and existing trail configuration
- Monitoring-service enablement status and documented cost decision
- Security findings, remediation planning, and safe retesting

---

## Out of scope
- Exploitation or privilege escalation
- Credential attacks
- Denial-of-service testing
- Creation of public resources
- Production data
- EC2, container, serverless, RDS, and Kubernetes deep assessment
- Full network architecture review
- Full CIS, PCI DSS, ISO 27001, or AWS Well-Architected assessment
- Enabling paid services without an approved cost decision

---

## Regions
Primary review region: eu-central-1
Global services: IAM, account settings, and selected S3 account settings
Other Regions: Inventory only if resources or trails exist

---

## Change rule
No configuration change is made until the existing state, expected effect, owner, rollback or recovery consideration, and cost impact are recorded.

## Evidence boundary
Raw AWS evidence remains local and is excluded from Git. Portfolio evidence uses aliases and redaction. The fictional Velora business context is Simulated.

