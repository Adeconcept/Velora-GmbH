# Scope and Assumptions

## Objective
Assess whether workforce, privileged, guest, departed, and service identities have appropriate authentication, ownership, lifecycle, and application access in the fictional Velora Commerce GmbH environment.

---

## Review Date
24 August 2026

---

## In Scope
* Microsoft Entra workforce identities
* Privileged workforce identities
* Departed-user accounts retained in the directory
* Guest identities
* Service identities
* Microsoft 365, GitHub, AWS, Zendesk, Stripe, Personio, Splunk, product analytics, and the customer administration application
* MFA, RBAC, JML, access review, privileged access, emergency access, and service-identity governance

---

## Out of Scope
* Customer authentication design
* Real Entra tenant administration
* Production access removal
* Legal employment or retention decisions
* Physical access
* Real employee, guest, or vendor data
* Microsoft licensing assessment

---

## Evidence Period
Simulated point-in-time review using activity and access data through 24 August 2026.

---

## Evidence Labels
Observed, Tested, Simulated, Assumed, Recommended, and Not Provided.

---

## Baseline Population Parameters
The directory boundary encompasses **71 in-scope identity objects** cross-referenced against Personio as the assumed authoritative Human Resources (HR) source:
* **60 Active Workforce Identities:** Includes the core employee base (4 privileged administrator identities are embedded within this group).
* **2 Retained Departed-User Identities:** Historic employee accounts still lingering within the active directory path.
* **4 Service Identities:** Non-human programmatic accounts used for application-to-application integrations.
* **5 Guest Identities:** External third-party contractor or vendor access accounts.

---

## Core Governance Rules & Criteria
1. **Stale Account Threshold:** An account is classified as operationally stale after **45 days without a recorded interactive sign-in**, unless the assigned owner formally documents an active, approved business exception.
2. **Guest Identity Boundary:** Every guest access profile must possess a explicitly named internal corporate sponsor and a hard-coded termination end date.
3. **Service Identity Hardening:** Service accounts must map to a named human owner, state a defined business purpose, follow strict least-privilege configurations, and have interactive web sign-ins blocked by policy unless an approved exception is documented.
4. **Privileged Account Attestation:** Elevated administrative workforce access accounts must be subjected to a formal, documented access review at least quarterly.

---

## Compliance Context & Scenario Limitations
* **Historical Baseline:** Week 17 rated risk registers **R-001** and **R-002** as *High*, while Week 18 recorded control gaps **F-003** for missing multi-factor authentication (MFA) and **F-004** for missing access reviews.
* **Scope Disclaimer:** The 45-day threshold, sample log data, and tool configurations are fictional Velora policy choices and synthetic variables designed for portfolio learning. This report does not represent Microsoft default product configurations, real production environments, or a universal legal audit requirement.

---

## Conclusion Boundary
This project demonstrates an IAM review method using synthetic data. It is not a real access certification or production configuration assessment.

