# Application System Overview

This document defines the integrated architecture baseline, technical boundaries, recovery tolerances, and interactive user personas governing the Velora Customer Web Application environment.

## 1. Core Technical Components & Asset Registry Mappings
The application lifecycle unifies discrete computing assets, data storage repositories, and governance platforms into a singular e-commerce service footprint.

| Item | System Component Identity / Details | Portfolio Context Label |
| :--- | :--- | :--- |
| **Business Service** | Customer storefront browsing, authentication workflows, checkout routing, and order metadata processing. | Simulated Business Context |
| **Critical Application** | **AST-001** (Customer Web Application / API Gateway front-end edge layer). | Reused from Enterprise Inventory |
| **Critical Database** | **AST-002** (Relational storage repository retaining historical profiles). | Reused from Enterprise Inventory |
| **Cloud Environment** | **AST-003** (AWS cloud infrastructure environment deployed in region `eu-central-1`). | Simulated Operational Boundary |
| **Application Server** | **AST-004** (Ubuntu Linux instance hosting application core processing structures). | Reused from Enterprise Inventory |
| **Workforce Identity** | **AST-006** (Microsoft Entra ID identity provider managing corporate staff tracking). | Simulated Use / Asset Reused |
| **Source Control** | **AST-009** (GitHub source code repositories and integration hooks). | Reused from Enterprise Inventory |
| **Payment Service** | **AST-010** (Stripe software-as-a-service processing integration boundary). | Reused from Enterprise Inventory |
| **Audit Log Source** | **AST-013** (AWS CloudTrail native configuration tracking and telemetry loops). | Reused from Enterprise Inventory |
| **SIEM Destination** | **AST-014** (Hosted Splunk instance managing corporate security operations ingestion). | Reused from Enterprise Inventory |
| **Restricted Data Assets** | **DAT-001** (Customer Identity Profile Data) and **DAT-002** (Order/Payment Metadata). | Reused from Enterprise Inventory |
| **Configuration Data** | **DAT-004** (Confidential application source code and cloud deployment parameters). | Reused from Enterprise Inventory |
| **Security Logs Data** | **DAT-006** (Confidential infrastructure activity records and application security trails). | Reused from Enterprise Inventory |

## 2. Business Continuity & Disaster Recovery Tolerances
The system architecture implements data mirroring, isolated logging pipelines, and automated cluster recovery controls to adhere to strict corporate survival thresholds:

*   **Recovery Time Objective (RTO):** **4 Hours** maximum permitted operational downtime window for storefront recovery following a catastrophic node or structural hosting crash [Simulated Baseline].
*   **Recovery Point Objective (RPO):** **1 Hour** maximum acceptable data loss threshold applied explicitly to the primary transaction application database (**AST-002** / **DS-01**) through automated, point-in-time point transaction logs shipping [Simulated Baseline].

## 3. Authorized Interactive Personas & Identity Profiles
The application runtime boundary separates computational processing tracks, route permissions, and access privileges based on eight distinct structural user and system roles:

1. **Anonymous Visitor:** Unauthenticated external network entity allowed strictly to perform public storefront inventory browsing, pricing reviews, and initial account registration workflows via `/filter` and `/search` routes.
2. **Authenticated Customer:** Standard external consumer possessing valid session tokens who has passed primary login checks, authorized to add items to shopping carts, update private profile files (`DAT-001`), initialize checkout tokens, and track personal transaction data records (`DAT-002`).
3. **Support Agent:** Internal employee authenticated via corporate workforce single sign-on (`AST-006`) with restricted permissions to query user order states, adjust shipping status, and triage standard buyer issues without direct access to database configurations.
4. **Finance User:** Privileged internal corporate profile authenticated via single sign-on, authorized to access accounting reports, execute ledger reconciliations, read billing transaction metadata strings, and run order refund calls.
5. **Application Administrator:** High-privilege internal systems manager tasked with configuring global application parameters, tuning resource utilization metrics, auditing runtime exceptions, and executing authorized maintenance workflows.
6. **Developer:** Corporate engineer responsible for creating code features, maintaining automation pipelines, fixing bugs, and pushing source modifications to code repositories (`AST-009`) under continuous integration testing rules.
7. **CI/CD Service Identity:** Automated, cryptographically authenticated non-human deployment worker (e.g., GitHub Actions token profile) executing compiled source builds, running unit security tests, and packaging cloud container deployments under automated branch protection constraints.
8. **Security Analyst:** Internal defensive operator task-allocated to monitor logging trails (`DAT-006`), trace alerts inside the central SIEM console (**AST-014**), review code scanning results, maintain threat model registers, and validate secure SDLC compliance rulesets.

