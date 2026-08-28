# Modeling Assumptions and Systemic Limitations

This document registers the architectural assumptions and boundaries framing the Velora Customer Web Application threat model.

## 1. System Assumptions
*   **AWS Hosting Infrastructure:** The fictional application and its data tier repositories are deployed within region `eu-central-1` under AWS control parameters (**AST-003**).
*   **Managed Perimeter Edge Protection:** Element `P1` represents an authorized, managed public reverse proxy and Web Application Firewall capable of terminating TLS and executing basic layer-7 request throttling.
*   **Authentication Decoupling Model:** Customer identity authentication is managed natively by the application core engine, while all internal corporate workforce identities rely on single-sign-on claims passed by Microsoft Entra ID (**AST-006**).
*   **Cardholder Data Isolation Boundary:** The architecture depends entirely on external Stripe fields (**AST-010**) to handle raw transaction data. Velora stores only alphanumeric payment reference tokens natively.
*   **Webhook Integrity Verifications:** Inbound notification channels from Stripe support cryptographic signatures, custom endpoint secrets, and unique transaction identifiers to facilitate server-side event tracking.
*   **Pipeline Source Management:** GitHub (**AST-009**) manages secure source control repository storage and acts as the root of trust to initiate deployment inputs into production zones.
*   **Security Telemetry Aggregation:** CloudTrail configurations and application audit monitors successfully forward structured events over cross-boundary transit lines directly to Hosted Splunk (**AST-014**).
*   **Computational Modeling Layer Depth:** The application core components and exposed API routing paths are analyzed as a single logical process node for the current architectural depth of this model.

## 2. Technical Limitations
*   **Fictionalized Baseline Architecture:** This project analyzes a simplified model and does not draw from live stakeholder interviews, live network traffic traces, or production server logs.
*   **Unverified Third-Party Controls:** The security, uptime, and token-signing properties of external SaaS partners (Stripe, GitHub, Microsoft Entra ID) cannot be independently audited or validated.
*   **Threat Vector Tracking Boundaries:** Analysis using the STRIDE framework focuses on classic engineering flaws and may not identify all potential privacy exposures, insider fraud models, physical physical data safety risks, or complex operational logic failures.
*   **Exclusion of Specialized Security Models:** No comprehensive LINDDUN privacy threat analysis or formal OWASP ASVS v5.0.0 compliance certification was executed.
*   **Execution Posture Status:** All written security requirements and verification plans operate strictly as *Recommended* and *Planned* architectural targets rather than active production configurations.
*   **Deferred Enterprise Architecture Tracks:** Deep audits covering full AWS virtual private network subnets, KMS key management life cycles, granular disaster recovery backups, and live incident response workflows are deferred to separate portfolio project blocks.
*   **Model Longevity Requirements:** The structural threats documented within this ledger lose validity whenever material application code alterations, routing infrastructure shifts, or core business logic modifications occur.

