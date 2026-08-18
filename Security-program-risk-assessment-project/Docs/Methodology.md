# Risk Management and Assessment Methodology

This document outlines the custom qualitative risk assessment framework utilized for this portfolio to systematically identify, evaluate, and treat information security risks. This methodology operates independently from standardized frameworks to fit specific internal organizational baselines.

---

## Risk Statement Format

To ensure actionable clarity, all risk descriptions must explicitly articulate the operational weakness, the event, and the ultimate downstream impact. Risks must be documented using the following structure:

**"Because [cause or weakness], [threat event] may occur, leading to [business impact]."**

* **Compliant Example:** Because MFA is not enforced for every user, stolen credentials may be used to access Microsoft 365, leading to mailbox compromise, fraud, or confidential-data exposure.
* **Non-Compliant Example:** Phishing is high risk. (Fails to isolate the technical weakness, targeted asset, or corporate impact).

---

## Risk Scoring Framework

The calculation of operational risk relies on evaluating the likelihood of an event against its potential business consequences. 

### 1. Likelihood Scale

| Score | Label | Decision Rule |
| :--- | :--- | :--- |
| 1 | Rare | Requires unusual conditions and has little exposure |
| 2 | Unlikely | Possible, but meaningful barriers or controls exist |
| 3 | Possible | Credible scenario with some exposure or partial controls |
| 4 | Likely | Common threat and an important control weakness exists |
| 5 | Almost certain | Expected repeatedly or already observed without effective control |

### 2. Impact Scale

| Score | Label | Decision Rule |
| :--- | :--- | :--- |
| 1 | Insignificant | Negligible disruption and no sensitive-data effect |
| 2 | Minor | Limited team disruption and easy recovery |
| 3 | Moderate | Material department disruption, limited data exposure, or customer support impact |
| 4 | Major | Critical service disruption, significant confidential-data exposure, fraud, or contractual impact |
| 5 | Severe | Prolonged core-service outage, large restricted-data exposure, serious legal impact, or existential financial harm |

### 3. Severity Matrix and Actions

Risk Score is calculated using the following formula:
$$\text{Risk Score} = \text{Likelihood} \times \text{Impact}$$

The resulting score determines the severity tier and dictates mandatory organizational response timelines:

| Score Range | Severity | Required Action |
| :--- | :--- | :--- |
| 1 to 4 | Low | Accept or monitor with manager approval |
| 5 to 9 | Medium | Assign owner and review date |
| 10 to 14 | High | Create mitigation and target date |
| 15 to 25 | Critical | Escalate and implement an interim control within 14 days |

---

## Control Effectiveness Evaluation

Existing security baselines mitigating a risk must be evaluated and rated based on operational evidence and design coverage:

| **Rating** | **Meaning** |
|------------|-------------|
| **Effective** | Implemented, relevant, consistently operating, and supported by evidence. |
| **Partially effective** | Exists but has coverage, design, documentation, or testing gaps. |
| **Ineffective** | Exists on paper but does not meaningfully reduce the risk. |
| **Not present** | No relevant existing control was identified. |

---

## Risk Treatment Strategy

Upon determining final risk severity, owners must choose a formal treatment strategy aligned to these criteria:
| **Treatment** | **When to use it** | **Example** |
|---------------|--------------------|-------------|
| **Mitigate** | Reduce likelihood or impact with controls. | Enforce multi-factor authentication (MFA). |
* **Avoid** | Stop the risky activity entirely. | Remove an unnecessary public-facing network service.* |
* **Transfer** | Shift part of the financial or operational consequence to external entities. | Procurement of cyber insurance or structured contractual allocation. |
| **Accept** | Formally tolerate residual risk within corporate appetite boundaries. | Documenting a low-impact internal administrative tool risk. |


---

## Scoring Calibration Examples

The following real-world examples illustrate how the scoring criteria and decision rules are applied to the repository's risk register.

### Example 1: Critical Operating System Vulnerabilities (R-003 — Ubuntu Patching)
* **Inherent Likelihood (4 - Likely):** Because this server hosts critical application dependencies and is directly exposed to the internet, it is a highly visible target. Relying entirely on manual human intervention to discover and apply updates creates a persistent and dangerous security gap.
* **Inherent Impact (5 - Severe):** If a threat actor successfully exploits a core operating system vulnerability, they could gain complete administrative control. This would allow them to take down the production environment, halt the customer checkout process, and compromise restricted database records.
* **Control Effectiveness (Partially Effective):** The current system administrators do occasionally run updates, but this work is done on an informal, undocumented schedule without automated scanning or tracking.
* **Residual Likelihood (3 - Possible):** The informal admin updates act as a partial barrier, which lowers the probability of an attack from "Likely" to "Possible." However, the lack of a standardized schedule means a window of exposure still regularly exists.
* **Residual Impact (5 - Severe):** The impact score remains completely unchanged. Applying patches lessens the frequency of the vulnerability, but it does absolutely nothing to soften the catastrophic operational blow if a hacker breaks through before the patch is applied.

### Example 2: Unverified Disaster Recovery Readies (R-005 — Backup Restoration)
* **Control Evaluation (Ineffective):** While automated backup schedules are actively running and generating data files, the organization has never performed a successful restoration rehearsal to see if those files actually work. 
* **Residual Likelihood & Impact Judgment (Critical - 3×5=15):** Automated jobs mean we are unlikely to have zero data copies, but because the recovery process is entirely unverified, we cannot prove the files aren't corrupted or incomplete. If a ransomware attack strikes, a restoration failure would completely cripple the customer database and halt core operations. Because this scenario would cause a prolonged core outage with no verified fallback, the residual risk score must remain at a **Critical** severity tier until a successful live test is executed and documented.

### Example 3: Gaps in Multi-Factor Authentication (R-001 — MFA Coverage)
* **Control Evaluation (Partially Effective):** The company enforces multi-factor authentication (MFA) strictly for IT and system administrators, which successfully blocks the most dangerous high-privilege access pathways.
* **Residual Likelihood (3 - Possible):** Even though administrative accounts are locked down, general business users are still allowed to log in with basic passwords. These standard employees are heavily targeted by everyday phishing campaigns, meaning an account takeover remains a highly credible threat.
* **Residual Impact (4 - Major):** A compromised standard employee account does not grant full cloud access, but it allows an attacker to control a corporate mailbox. From there, they can read confidential company emails, launch internal invoice fraud, and trick other employees into escalating their access.
