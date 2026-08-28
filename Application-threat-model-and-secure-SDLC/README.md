# Application Threat Model and Secure SDLC

## Executive Summary
I created a threat model and secure-development workflow for Velora Commerce's fictional customer application [Simulated]. The project maps Critical business assets, Restricted data, external services, eleven data flows, and trust boundaries, then uses STRIDE and abuse cases to identify design threats [Tested].

Each priority threat links to a risk decision, measurable security requirement, verification test, owner, and release gate [Recommended]. The architecture and business context are Simulated, while traceability and scoring consistency are Tested [Tested].

## Business Problem
Velora's fictional storefront and checkout depend on customer accounts, Restricted data, AWS, Stripe, workforce identity, source control, and security logging [Simulated]. Security weaknesses found late are expensive to correct, so the team needs security requirements and verification gates before release [Recommended].

---

## Objectives
- Model the system and trust boundaries.
- Identify threats systematically with STRIDE.
- Describe attacker goals through abuse cases.
- Prioritize threats using business impact.
- Translate threats into testable requirements.
- Define secure SDLC responsibilities and release gates.
- Trace each priority control to verification evidence.

---

## System in Scope
- **AST-001** customer web application
- **AST-002** customer and order database
- **AST-003** AWS production account
- **AST-004** Ubuntu application server
- **AST-006** Microsoft Entra ID
- **AST-009** GitHub repositories
- **AST-010** Stripe payment service
- **AST-013** CloudTrail audit logs
- **AST-014** hosted Splunk
- **DAT-001**, **DAT-002**, **DAT-004**, and **DAT-006**

---

## Method
Scope -> Model -> Identify assets and flows -> Mark trust boundaries -> Apply STRIDE -> Write abuse cases -> Score risk -> Select response -> Write requirements -> Define tests -> Apply security gates -> Review change

---

## Key Results
- DFD elements: **11**
- Data flows: **11**
- Threats identified: **12**
- Critical inherent threats: **2** (`TM-004`, `TM-006`)
- High inherent threats: **8**
- Security requirements: **12**
- Planned verification tests: **12**
- Blocking security gates: **7**

---

## Priority Decision
The highest-priority design threat identified was **TM-004 (SQL Injection in Catalog Engine)**, carrying a Critical inherent risk score of **20** [Tested]. To address this, security requirement **SR-001** mandates the complete use of statically parameterized queries across all data abstraction wrappers [Recommended]. This control will be verified before production code integration via test plan **ST-001** (Query Parameterization Validation) [Planned], owned directly by the **Development-Team** [Simulated] and enforced as a blocking condition at development pipeline gate **G3 (Code and Build)** [Recommended].

---

## Project Connection
SQL injection, reflected XSS, missing authorization, and 2FA bypass were reproduced only in authorized PortSwigger training labs [Observed]. Week 22 uses those lessons to create preventive design requirements without claiming the weaknesses existed at Velora [Tested].

---

## Repository Contents
- `architecture/`, DFD, element inventory, flow inventory, and trust boundaries
- `registers/`, threats, requirements, and risk acceptance
- `abuse-cases/`, misuse scenarios and linked controls
- `sdlc/`, lifecycle, gates, and responsibilities
- `testing/`, test plan and end-to-end traceability
- `reports/`, technical and executive reporting

---

## Skills Demonstrated
Application threat modeling, data-flow analysis, trust-boundary identification, STRIDE, abuse cases, risk assessment, security requirements, OWASP ASVS, NIST SSDF, secure SDLC design, release governance, test planning, and executive communication.

---

## Limitations
This is a fictional architecture exercise, not an assessment of a real company [Tested]. No source code, production system, cloud configuration, vendor control, or security test was reviewed [Tested]. Requirements and residual-risk values remain Recommended targets until implementation and verification [Tested].
