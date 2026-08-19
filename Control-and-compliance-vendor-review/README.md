# Integrated Control, Compliance, Privacy and Vendor Review


## Executive Summary
I performed a simulated evidence-based review of 15 selected controls for Velora Commerce GmbH, a fictional 60-person e-commerce SaaS company. I connected control results to Week 17 risks, screened a personal-data processing activity, assessed vendor risk, and created a 12-action remediation plan.

---

## Business Problem
Velora had useful technical controls but limited proof that they were consistently governed, tested, or monitored. Leadership needed to know which controls worked, which gaps exceeded risk appetite, and what evidence would support closure.

---

## Objectives
* Define reproducible control criteria and evidence rules.
* Separate control design from operating effectiveness.
* Test governance, identity, vulnerability, logging, response, recovery, data, vendor, secret, and awareness controls.
* Identify privacy and third-party-risk decisions.
* Convert findings into owned and testable remediation actions.

---

## Method
The project used Examine, Interview, and Test concepts, selected NIST CSF 2.0 outcomes, CIS Controls v8.1 control areas, selected GDPR topics, and Velora's fictional Week 17 risk decisions. All evidence was synthetic or reused from the fictional Week 17 baseline.

---

## Key Results
* **14** evidence requests tracked.
* **15** controls assessed.
* **1 Pass, 7 Partial, 6 Fail, and 1 Not Tested** result.
* **13** findings recorded.
* **2 Critical** findings prioritized within 14 days.
* **7** vendors risk-prioritized.
* **1** DPIA screening and **1** vendor decision memo completed.
* **12** POA&M actions assigned to owners and validation steps.

---

## Priority Decisions
Backup restoration and critical-server patch evidence were prioritized first because they support Critical Week 17 risks. Universal MFA, cloud-event review, vendor governance, and the user-level analytics privacy decision form the next priority group.

---

## Evidence Quality
The review distinguished the existence of a control from proof that it operated. For example, backup jobs supported control design, but missing restore evidence prevented a positive recoverability conclusion.

---

## Privacy and Vendor Decision
Expanded user-level analytics was placed on conditional hold pending DPIA escalation, processor and security-term review, subprocessor transparency, privileged MFA evidence, incident commitments, and deletion requirements.

---

## Repository Contents
* `docs/` — Scope, criteria, methodology, evidence rules, and lessons learned
* `registers/` — Evidence requests, controls, findings, vendors, and POA&M
* `privacy/` — Processing review and DPIA screening
* `vendor/` — Questionnaire, assessment, and decision memo
* `reports/` — Detailed gap summary and executive summary
* `evidence/` — Fictional evidence summaries and sanitized screenshots

---

## Skills Demonstrated
Control assessment, IT audit reasoning, evidence handling, NIST CSF mapping, CIS Controls mapping, GDPR awareness, DPIA screening, third-party risk, finding writing, remediation planning, and executive communication.

---

## Limitations
All company and vendor evidence is fictional. This selected-control review is not a certification, audit opinion, legal opinion, or assessment of a real organization or supplier.

