# Identity and Access Governance Review

## Executive Summary
I performed a simulated IAM review for Velora Commerce GmbH, a fictional 60-person e-commerce SaaS company. I inventoried identity types, designed role-based access and joiner-mover-leaver controls, reviewed a 25-identity risk-based sample, automated exception detection with PowerShell, and converted the findings into an evidence-based remediation plan.

## Business Problem
Velora used centralized identity but had incomplete workforce MFA, manual offboarding, no formal quarterly review, standing privilege, and limited governance for guests and service identities.

## Objectives
*   Define who and what receives access across the enterprise directory.
*   Establish expected permissions through a formal RBAC matrix.
*   Control joiners, movers, leavers, guests, privileged identities, and workloads systematically.
*   Identify stale, excessive, conflicting, expired, and weakly authenticated access.
*   Create review decisions, owners, deadlines, evidence, and retests for clear accountability.

## Scope and Method
The fictional directory contained 71 objects. I selected all privileged workforce, departed workforce, service, and guest identities, plus ten standard workforce identities. Nine tests evaluated lifecycle, MFA, guest expiry, service ownership, interactive sign-in, inactivity, privileged review, mover access, and separation of duties.

## Key Results
*   **71-object** population documented.
*   **25** identities reviewed, representing **35.2%** risk-based coverage.
*   **27** automated PowerShell exceptions executed.
*   **2** manual role and separation-of-duties exceptions documented.
*   **26** total review rows generated.
*   **10** IAM findings established: **1 Critical, 7 High, and 2 Medium**.
*   **10** remediation actions mapped with completion evidence and binary retest criteria.

## Priority Decisions
The enabled leaver and expired guests were prioritized for immediate removal. Service interactive access, mover permissions, and financial approval conflict followed. Workforce MFA and privileged-access governance were treated as systemic improvements.

## Important IAM Distinction
Human users and service identities require different authentication controls. Workforce users require centrally enforced MFA. Service identities require ownership, non-interactive authentication, minimal permissions, credential protection, and workload monitoring.

## Repository Contents
*   `docs/` — Architecture, RBAC, JML workflows, access requests, authentication standards, and privilege rules.
*   `registers/` — Population summaries, risk samples, role matrix, review results, findings, and remediation roadmaps.
*   `scripts/` — Repeatable PowerShell review engine.
*   `reports/` — Detailed access review, privileged review, and executive summary files.
*   `evidence/` — Fictional evidence summaries and sanitized screenshots.

## Skills Demonstrated
IAM, Microsoft Entra concepts, RBAC, least privilege, MFA governance, joiner-mover-leaver, access reviews, privileged access, service identities, separation of duties, PowerShell, evidence-based findings, and remediation validation.

## Limitations
Every identity and result is fictional. No real tenant, employee, vendor, or production system was accessed or changed.


---

## Evidence

![Powerrshell result](https://github.com/Adeconcept/Velora-GmbH/blob/7c1e4b549bfdefc16eaff918ea2dd019762f8515/Identity-and-access-governance/Evidence/Screenshots/02-powershell-review-result.png)
*Figure 1.  PowerShell review of 25 synthetic identities producing 24 automated exception rows across leaver, MFA, guest, service, stale, and privileged-access tests.*




![Result](https://github.com/Adeconcept/Velora-GmbH/blob/4c536093573c6d84a58503abc327903972614d5a/Identity-and-access-governance/Evidence/Screenshots/03-iam-results-and-remediation.png)
*Figure 2. IAM exception and severity summary showing why an enabled leaver receives immediate priority even though incomplete MFA produces more sample rows.*

