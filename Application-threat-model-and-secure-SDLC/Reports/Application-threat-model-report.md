# Application Threat Model & Secure SDLC Report

## Executive Summary
Velora Commerce GmbH executed an architectural threat modeling lifecycle and secure software development framework integration for the Customer Web Application ecosystem. The assessment modeled core user interfaces, backend database configurations, and external SaaS parameters to identify structural security design risks prior to code deployment. Analysis utilizing the STRIDE framework mapped 12 significant threat scenarios, with critical concerns centered on SQL injection vulnerabilities within catalog lookups and broken access control risks on administrative interfaces. To mitigate these exposures, we established 12 measurable security requirements derived from OWASP ASVS v5.0.0 and mapped them directly to testable verification scripts. Security gate milestones were embedded across all development phases to block vulnerable releases from reaching production compute environments. This assessment maps a simulated architecture within an isolated laboratory framework, and all validation tests remain planned pending a verifiable engineering build release.

## Objective
The primary objective of this project is to implement a proactive threat modeling methodology and secure governance framework. By identifying security flaws during design rather than after deployment, we map risk mitigation strategies to clear development requirements and test plans.

## Scope and Assumptions
*   **Target Domain Boundary:** Internet edge entry routing pipelines down to computing nodes and relational backend databases.
*   **External Integrations:** Stripe payment services (`AST-010`) and Microsoft Entra ID (`AST-006`) are treated as external trust entities.
*   **Data Handling Assumptions:** The model assumes that the infrastructure stores payment tokens rather than full cardholder data records, and that database access is network-restricted to local processes.
*   **Evidence Labeling:** Technical architectures are marked as *Simulated*, structural data flows as *Assumed*, and development guidelines as *Recommended*.

## System Overview
The Customer Web Application (**AST-001** / **AST-004**) supports e-commerce storefront browsing, identity authentication, shopping cart processing, and payment checkout functions. The system handles **Restricted** datasets encompassing customer identities (`DAT-001`) and order transaction metadata (`DAT-002`), along with **Confidential** engineering source configurations (`DAT-004`). Access controls govern eight core interactive personas, including Anonymous Visitors, Authenticated Customers, and single-sign-on authenticated Support and Finance internal staff.

## Data-Flow Diagram
The system architecture was decomposed into an operational diagram mapping data movement, process nodes, and information repositories across strict administrative boundaries:

*   **TB1 (AWS Environment Boundary):** Separates the public internet perimeter from the internal reverse proxy edge and web compute instances.
*   **TB2 (External SaaS Integration Boundary):** Governs network interfaces connecting internal systems with third-party environments (GitHub pipelines, Stripe payment systems, and Entra ID tokens).
*(The complete Mermaid code block layout is maintained inside the portfolio repository at `architecture/data-flow-diagram.md`).*

## Methodology
The assessment strictly followed a structured threat modeling lifecycle: deconstructing system elements into a Data-Flow Diagram, executing a STRIDE review across all trust boundaries, building misuse abuse case models, computing risks via a 5x5 matrix, assigning risk responses, translating choices into security requirements, and mapping controls to explicit test plans.

## Threat Summary
The STRIDE calculation engine mapped 12 unique, non-overlapping threat scenarios:

| STRIDE Category | Critical Risks | High Risks | Medium Risks | Low Risks | Total threats |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Spoofing** | 0 | 2 | 1 | 0 | **3** |
| **Tampering** | 0 | 2 | 1 | 0 | **3** |
| **Repudiation** | 0 | 1 | 0 | 0 | **1** |
| **Information Disclosure** | 1 | 1 | 0 | 0 | **2** |
| **Denial of Service** | 0 | 1 | 0 | 0 | **1** |
| **Elevation of Privilege** | 1 | 1 | 0 | 0 | **2** |
| **Total Counts** | **2** | **8** | **2** | **0** | **12** |

## Priority Threats
*   **TM-004 (SQL Injection - Critical risk score 20):** Unsafe dynamic string concatenation within database filter lookups allows unauthenticated attackers to alter query structures, causing full table data exposure.
*   **TM-006 (Administrative Panel Bypass - Critical risk score 20):** Anonymous users can access the administrative control console directly via URL path injection, bypassing security checkpoints to delete user directories.
*   **TM-002, TM-008, TM-009 (High risks):** Focus on client-side price manipulation vectors, multi-factor step circumvention via direct path mapping, and forged third-party webhook payment confirmation tracking replays.

## Security Requirements
Twelve explicit security requirements were built to secure the application footprint:
*   *Input & Output Safety:* Parameterized queries (`SR-001`) and context-aware output encoding rules (`SR-002`) protect against injection strings.
*   *Access Controls:* Deny-by-default server-side authorization interceptors (`SR-003`) protect administrative consoles, and state-locked multi-factor verification (`SR-004`) protects login flows.
*   *Integration Guardrails:* Stripe signatures and timestamp limits (`SR-006`) prevent webhook forgery, while secret scanning tools (`SR-009`) block committed keys.
*   *Operations:* Database connection rules (`SR-011`) restrict runtime privilege levels, while throttling configurations (`SR-012`) defend against Denial of Service spikes.

## Secure SDLC and Gates
Security criteria are enforced through seven automated code promotion gates (`G0` through `G6`). Progression is blocked if an application commit fails required pipelines, contains plaintext secrets (`G3`), or carries unmitigated Critical or High software design flaws (`G4`). Release readiness requires verified deployment templates, valid system monitoring configurations, and operational rollback scripts (`G5`).

## Verification Plan
Verification parameters are tracked inside a unified data testing ledger (`testing/security-test-plan.md`). Testing coverage covers 12 dedicated verification plans (`ST-001` through `ST-012`) tracking positive execution behavior and negative abuse test scripts. All test parameters remain classified as **Planned** pending the availability of an approved engineering build.

## Residual Risk
All residual risk numbers operate as future engineering targets. Achieving risk reduction down to Low or Medium scores requires verifying implemented controls against assigned automated test scripts.

## Limitations
This assessment analyzes a fictional architecture within an isolated laboratory model. It lacks direct access to live production code repositories, excludes a complete OWASP ASVS checklist audit, uses simplified cloud configurations, and does not run functional exploits against live computing nodes.

## Conclusion
The most critical architectural decision is **DEC-002**, which isolates credit card data by storing only Stripe references to limit data exposure liabilities. The immediate next step is embedding the automated secret scanning hooks and query parameterization validations into the continuous integration deployment pipeline to enforce compliance.

