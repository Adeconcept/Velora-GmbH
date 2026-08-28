# Application Security Roles and Responsibilities (RACI Matrix)

This document establishes accountability and assigns operational tasks across engineering, product management, and security roles.

## 1. Core Security Governance RACI Matrix

| Secure SDLC Activity | Product Owner | Engineering Lead | Developer | QA | Security Analyst | IT Manager | Risk Owner |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **Classify Feature & Data** | **A / R** | C | I | I | C | I | I |
| **Create & Update Threat Model** | C | **A / R** | C | C | R | C | I |
| **Approve Security Requirements** | **A** | R | C | C | R | I | I |
| **Implement Security Controls** | I | **A** | R | C | C | C | I |
| **Run Security Tests** | I | **A** | C | R | R | C | I |
| **Approve Risk Acceptance** | C | C | I | I | R | C | **A** |
| **Approve Release Gate** | C | **A / R** | I | C | C | C | I |
| **Monitor & Respond to Incidents** | I | C | C | I | R | **A / R** | I |

---

## 2. Matrix Legend & Operational Ground Rules
*   **R (Responsible):** The role tasked with executing the technical steps, writing the configuration parameters, or compiling the required evidence.
*   **A (Accountable):** The role with ultimate ownership of the outcome and final sign-off authority. To ensure clear governance, **each activity is limited to a single accountable role**.
*   **C (Consulted):** Domain experts whose inputs, technical reviews, and engineering guidance are gathered before finalizing decisions.
*   **I (Informed):** Stakeholders who are updated on progress or outcomes but do not directly execute or approve the activity.

