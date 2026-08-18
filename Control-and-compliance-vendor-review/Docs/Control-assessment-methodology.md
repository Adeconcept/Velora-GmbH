# Control Assessment Methodology

This document establishes the structured process and evaluation framework used to assess the design and operational maturity of all security, privacy, and vendor controls across Velora Commerce GmbH.

---

## Step 1: Define the Control Objective
The assessor must explicitly define the security or operational outcome that should be true if the control is functioning perfectly.
* *Example:* Backup data can be restored within the approved recovery objective.

---

## Step 2: Define the Criteria
The assessor must state the exact, observable condition required to achieve a passing evaluation.
* *Example:* At least one in-scope restore was completed during the last quarter, the restored data was validated, the elapsed time was recorded, and failed steps were assigned for correction.

---

## Step 3: Select the Method
Control validation must be performed using one or more of the following formal assessment techniques:
* **Examine:** Inspect system configurations, data policies, audit logs, compliance reports, ticketing queues, or formalized change approvals.
* **Interview:** Ask the assigned asset or business owner to explain system responsibilities, manual procedures, and handled exceptions.
* **Test:** Manually execute or reperform a controlled process to observe and document real-time outcomes.

---

## Step 4: Assess Design and Operation Separately
Controls must be dual-evaluated, distinguishing between how the control is planned (Design) and how it runs in practice (Operation).

| Rating | Design Conclusion (Plan) | Operating Conclusion (Execution) |
| :--- | :--- | :--- |
| **Effective** | The documented control can meet the objective. | Evidence shows it ran consistently and exceptions were handled. |
| **Partially Effective** | The control could reduce risk but has missing scope, ownership, frequency, or detail. | It operated for only part of the population or assessment period. |
| **Ineffective** | The control design cannot reliably meet the target objective. | Evidence shows it did not achieve the expected outcome. |
| **Not Present** | No formal or informal control was identified. | No system operation is possible. |
| **Not Tested** | Evidence was insufficient to conclude. Do not guess. | Evidence was insufficient to conclude. Do not guess. |

---

## Step 5: Assign the Test Result
Following the gathering of evidence, the assessor must assign a definitive test result based on compliance thresholds:

* **Pass:** Criteria were fully met for the reviewed scope, and objective evidence supports the conclusion.
* **Partial:** Some assessment criteria were met, but a material operational gap remains.
* **Fail:** Criteria were not met or the security control is entirely absent.
* **Not Tested:** Available evidence is structurally insufficient for a defensible, auditable conclusion.

---

## Step 6: Record a Finding
Every identified control gap or failure must be documented using a strict five-part finding template:

* **Criteria:** What should be true? (The required target baseline or rule).
* **Condition:** What evidence shows now? (The current, factual state observed).
* **Cause:** Why does the gap exist? (The underlying driver, process failure, or resource constraint).
* **Risk:** What may happen because of the gap? (The potential downstream business impact).
* **Recommendation:** What action should address the cause? (The tactical remediation steps required).

---

### Finding Severity Rule
Finding severities are directly anchored to their associated risk profile from the core security program risk assessment. Assessors must not calculate a second, arbitrary risk score.

| Finding Severity | Decision Rule |
| :--- | :--- |
| **Critical** | The gap directly supports a Critical residual risk and no reliable compensating evidence exists. |
| **High** | The gap directly supports a High risk, affects Restricted data or a Critical service, and exceeds risk appetite. |
| **Medium** | The gap weakens governance or audit evidence but has limited immediate operational impact or a stronger compensating control. |
| **Low** | Minor documentation or system consistency issue with little immediate operational risk. |

