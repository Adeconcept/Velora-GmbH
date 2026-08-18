# Security Program Baseline and Risk Register

---

## Executive Summary
I assessed a fictional 60-person e-commerce SaaS environment to identify critical assets, connect technical weaknesses to business impact, and create a prioritized 90-day cybersecurity plan.

---

## Business Scenario
Velora Commerce GmbH uses Microsoft 365, Entra ID, Windows endpoints, GitHub, AWS, Ubuntu, and several SaaS vendors. The company has a small IT team and no dedicated security department.

---

## Objectives
- Establish asset and data visibility.
- Identify and score credible cybersecurity risks.
- Compare current and target NIST CSF 2.0 outcomes.
- Recommend accountable risk treatments.

---

## Scope and Method
The simulated assessment covered identity, endpoints, cloud services, the customer platform, sensitive data, logging, vendors, response, and recovery. Risks were scored using documented 1-to-5 likelihood and impact scales.

---

## Key Results
- 18 assets and 6 data sets inventoried.
- 10 risks assessed.
- 2 Critical and 8 High residual risks identified.
- 18 selected NIST CSF 2.0 outcomes reviewed.
- A sequenced 90-day treatment plan created.

---

## Priority Decisions
Critical-server patching and backup restoration were prioritized first because both affect core customer services and recovery. Identity, cloud storage, and cloud monitoring followed because they are shared dependencies across several services.

---

## Framework Context
The project uses NIST CSF 2.0 outcomes and references CIS Controls v8.1 concepts. The custom 0-to-4 assessment score is a portfolio aid, not a NIST Tier.

---

## Limitations
All company data and findings are fictional. This is not a formal audit, certification, or assessment of a real organization.

---

## Repository Contents
- `docs/`, scope, methodology, classification, and lessons learned
- `registers/`, asset, data, risk, and CSF profile data
- `reports/`, dependencies, heatmap, treatment plan, and executive summary
- `evidence/`, selected sanitized screenshots

## Skills Demonstrated
Cyber risk assessment, asset management, data classification, risk treatment, NIST CSF profiling, prioritization, and executive communication.
