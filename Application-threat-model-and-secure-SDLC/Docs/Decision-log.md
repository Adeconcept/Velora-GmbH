# Threat-Model Decision Log

This log lists the authoritative design, risk management, and architectural security governance decisions established for the Velora Customer Web Application footprint.

## DEC-001: Use STRIDE per Element
- **Date:** 2026-09-15
- **Decision:** Use STRIDE per element and trust-boundary crossing as the core threat-identification method.
- **Reason:** Provides a systematic, beginner-friendly framework that maps directly to our Data-Flow Diagram (DFD) elements (Processes, Data Stores, External Entities, and Data Flows), ensuring high-density coverage of security perimeters.
- **Alternative Considered:** PASTA (Process for Attack Simulation and Threat Analysis) or hierarchical attack trees for the full model.
- **Trade-off:** STRIDE identifies systemic flaw categories efficiently but lacks a native prioritization engine, requiring us to overlay an independent 5x5 quantitative risk matrix to compute actionable severities.
- **Label:** Simulated and Recommended

## DEC-002: Keep Payment-Card Data Outside Velora Storage
- **Date:** 2026-09-15
- **Decision:** Store only Stripe-issued alphanumeric payment reference tokens natively; never ingest, process, or retain primary account numbers (PAN), expiration dates, or CVV data.
- **Reason:** Materially reduces the sensitive data scope, isolates our production architecture from heavy compliance burdens, and reduces the impact of a potential breach.
- **Assumption:** The external Stripe-hosted payment fields interface natively with our web front-end to safely offload cardholder data processing.
- **Validation Needed:** Formal source code analysis, network configuration review, and Stripe SaaS contract review to confirm zero card leakage occurs.
- **Label:** Assumed and Recommended

## DEC-003: Enforce Authorization in the Application Layer
- **Date:** 2026-09-15
- **Decision:** Entra ID authentication tokens must never replace server-side application authorization checks on individual administrative endpoints.
- **Reason:** Microsoft Entra ID securely authenticates workforce identities and asserts role claims, but the application's internal code must enforce access controls over data rows and privileged endpoints.
- **Trade-off:** Increases architectural development overhead because developers must maintain custom server-side interceptor verification blocks rather than relying solely on identity provider tokens.
- **Label:** Recommended

