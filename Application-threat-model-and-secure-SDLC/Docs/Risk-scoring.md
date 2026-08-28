# Quantitative Risk-Scoring Methodology

This document outlines the standard 5x5 Likelihood and Impact risk assessment methodology used to prioritize architectural threat scenarios for Velora infrastructure assets.

## 1. Likelihood Assessment Criteria (1 to 5 Scale)
The likelihood rating measures the technical plausibility and historical frequency of a specific threat scenario, given our baseline environmental controls.

| Score | Rating | Operational Operational Criteria Description |
| :---: | :--- | :--- |
| **1** | **Rare** | High prerequisite complexity; requires advanced skills and strong preventive controls are actively running. |
| **2** | **Unlikely** | Plausible scenario, but requires highly specialized target conditions or narrow situational windows to execute. |
| **3** | **Possible** | A credible, documented attack path exists; standard tooling can achieve this without complex exploit chaining. |
| **4** | **Likely** | Uses a common operational technique; baseline design controls are thin, unvalidated, or missing. |
| **5** | **Almost Certain**| Direct network exposure exists with zero technical controls, or the flaw is trivial to execute repeatedly. |

## 2. Impact Assessment Criteria (1 to 5 Scale)
The impact rating measures the technical, financial, and operational damage to Velora infrastructure assets if a threat scenario succeeds.

| Score | Rating | Operational Operational Criteria Description |
| :---: | :--- | :--- |
| **1** | **Negligible** | No material data disclosure, compliance liability, or functional business effect. |
| **2** | **Minor** | Limited operational disruption; impacts a low-value service with no compromise of Restricted data. |
| **3** | **Moderate** | Material but contained data leakage; causes service degradation that can be handled within local engineering layers. |
| **4** | **Major** | Impacts critical application features; causes fraudulent transactions, service downtime, or leaks **Restricted** data. |
| **5** | **Severe** | Broad compromise of **Restricted** datasets, major financial fraud, or an extended outage of critical systems. |

## 3. Quantitative Risk Thresholds & SLA Expectations
The Risk Score represents the product of the independent likelihood and impact values:
$$\text{Risk Score} = \text{Likelihood Score} \times \text{Impact Score}$$

The final number determines the required remediation tracking speed and service level agreements (SLAs):

| Risk Score Range | Priority Tier | Operational Governance Expectation |
| :---: | :---: | :--- |
| **20 to 25** | **Critical** | The application design must change or the corporate risk owner must formally accept the risk before software is deployed. |
| **12 to 19** | **High** | Mitigation architecture and independent verification testing are required before the software can be released. |
| **6 to 11** | **Medium** | Remediation must be planned, scheduled, and verified within the approved delivery window sprint. |
| **1 to 5** | **Low** | Track, monitor, and address proportionately via regular lifecycle maintenance cycles. |

## 4. Residual Risk Reduction Rules
1. **No Speculative Likelihood Drops:** Engineers are strictly prohibited from lowering the residual likelihood score simply because a defensive control has been proposed or written in a document. The score can only be lowered once the control is physically embedded in the architecture and an automated or manual verification check is assigned to validate it.
2. **Impact Score Consistency:** The impact score must remain unchanged unless the technical control genuinely reduces the consequences of a successful exploit, rather than just lowering its probability. For example, deploying a web application firewall drops the *likelihood* of an attack getting through, but the *impact* remains identical if the underlying backend code remains vulnerable.

