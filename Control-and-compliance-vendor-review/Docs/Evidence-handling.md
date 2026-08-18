# Evidence Handling Procedure

This document defines the strict classification standards, rules of evidence, and handling protocols for all assessment artifacts within the Velora Commerce GmbH compliance framework.

## Evidence Classification Labels

Every artifact evaluated or referenced must be labeled with exactly one of the following classification criteria to maintain data integrity and non-repudiation:

| Label | Meaning | Acceptable Example |
| :--- | :--- | :--- |
| **Observed** | Seen directly in your own lab or a supplied fictional artifact | Week 17 CSV row or your controlled restore result |
| **Tested** | You performed a controlled procedure and recorded expected versus actual result | Formula recalculation or lab restore test |
| **Simulated** | Created as fictional evidence for the Velora scenario | Fictional MFA summary |
| **Assumed** | A fact needed for the exercise but not proven | Analytics uses user-level event data |
| **Recommended** | A future action, not an implemented control | Enforce MFA for all users |
| **Not provided** | Evidence was requested but no artifact was available | Awareness completion records |

## Operational Rules of Evidence

To guarantee audit defensibility and structural quality across all registers and matrices, the following procedural rules must be enforced without exception:

* **Unique Identification:** Give every evidence item a unique ID beginning with `EV-` (e.g., `EV-001`, `EV-002`).
* **Metadata Tracking:** Record the evidence source, requested date, received status, and specific security controls supported.
* **No Verbal Assurance Pass:** Do not mark an interview statement as proof of operating effectiveness without an objective system record, configuration dump, or controlled test log.
* **No Tool Infiltration Assumptions:** Do not infer a pass from the existence of a tool alone (the mere presence of a license or agent does not prove effective policy enforcement).
* **Limitation Transparency:** Record all identified evidence limitations explicitly within the companion control matrix.
* **Data Minimization:** Do not include real account names, IDs, IP addresses, contracts, active credentials, or real vendor documents under any circumstances.
* **Storage Location Boundary:** Keep all fictional evidence summaries localized exclusively within the `evidence/fictional-evidence/` repository folder.
* **Strict Screenshot Usage:** Use screenshots only to prove your own work product (such as validating repository folder structures or workflow configurations), never as the primary source of control operating effectiveness evidence.

