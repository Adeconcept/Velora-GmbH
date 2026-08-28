# Custom Likelihood and Impact Severity Model

This document defines the custom quantitative risk prioritization model utilized by Velora Commerce GmbH to assess web application vulnerabilities. This framework calculates risk independently of standard CVSS, OWASP, or PortSwigger scoring methodologies to reflect direct business context.

---

## 1. Likelihood Factors (1 to 4 Scale)

The likelihood score determines the probability of a vulnerability being successfully identified and exploited by a threat actor.

| Factor | 1 | 2 | 3 | 4 |
| :--- | :--- | :--- | :--- | :--- |
| **Discoverability** | Difficult; internal or source knowledge required | Requires careful or specific manual testing | Visible input field or clear path clue present | Obvious, highly public, and repeatable |
| **Exploitability** | Complex, unstable, or highly unreliable | Requires several exact pre-conditions | Simple controlled request parameter change | Trivial, immediate, and fully reliable |
| **Required Privilege** | High administrative privileges required | Authenticated special or customized role | Valid standard account or known password | No authentication required (anonymous) |
| **User Interaction** | Victim must take a highly complex action | Victim must interact with crafted content | Limited interaction or workflow state lock | Completely independent; no victim interaction |

### Likelihood Calculation Formula
The total likelihood represents the rounded average of all four variables:
$$\text{Likelihood Score} = \text{ROUND}\left(\frac{\text{Discoverability} + \text{Exploitability} + \text{Required Privilege} + \text{User Interaction}}{4}, 0\right)$$

---

## 2. Impact Factors (1 to 4 Scale)

The impact score evaluates the potential technical and business damage to Velora infrastructure if exploitation occurs.

| Factor | 1 | 2 | 3 | 4 |
| :--- | :--- | :--- | :--- | :--- |
| **Confidentiality** | No sensitive information exposed | Limited non-sensitive asset data leaked | One standard user's sensitive data exposed | Broad Restricted corporate data exposure |
| **Integrity** | No unauthorized data modification | Minor content or cosmetic change | Standard user or business record modified | Administrative or broad critical system change |
| **Availability** | No impact to service availability | Minor non-critical feature interruption | Important service degradation or latency | Critical infrastructure or service outage |
| **Business Scope** | Lab-only technical effect (Simulated) | One low-value operational function | Critical customer-facing function | Multiple critical functions or regulated data |

### Impact and Risk Calculation Formulas
The total impact represents the rounded average of all four variables. The final risk score represents the product of likelihood and impact, spanning a range from **1 to 16**:
$$\text{Impact Score} = \text{ROUND}\left(\frac{\text{Confidentiality} + \text{Integrity} + \text{Availability} + \text{Business Scope}}{4}, 0\right)$$
$$\text{Risk Score} = \text{Likelihood Score} \times \text{Impact Score}$$

---

## 3. Risk Thresholds and SLAs

| Risk Score | Final Severity | Simulated Remediation SLA |
| :---: | :---: | :---: |
| **13 to 16** | **Critical** | **7 days** to verify patch or deploy mitigation |
| **9 to 12** | **High** | **14 days** to remediate via code modification |
| **5 to 8** | **Medium** | **30 days** to remediate via standard sprints |
| **1 to 4** | **Low** | **90 days** to close or formally document acceptance |

### Spreadsheet Implementation Formulas
Assuming likelihood factors map to columns `J` through `M`, and impact factors map to columns `O` through `R`:
*   **Likelihood Score (Column N):** `=ROUND(AVERAGE(J2:M2),0)`
*   **Impact Score (Column S):** `=ROUND(AVERAGE(O2:R2),0)`
*   **Risk Score (Column T):** `=N2*S2`
*   **Severity Rating (Column U):** `=IF(T2>=13,"Critical",IF(T2>=9,"High",IF(T2>=5,"Medium","Low")))`


---

## 4. Grounding and Scoring Rules
1. **Evidence Binding:** Rate only impacts directly supported by technical test logs and explicit simulated business context. 
2. **No Speculative Escalation:** Do not assign a Confidentiality rating of 4 to an SQL injection vulnerability if broad database exfiltration was not tested. Do not assign an Integrity rating of 4 to XSS when only a harmless local alert was demonstrated.
3. **Context Attribution:** Record the Velora business scope strictly as `Simulated` and technical observations as `Tested`.

---

## 5. Worked Severity Training Examples
*These foundational data rows illustrate the model architecture and are excluded from active findings registers.*

| Example ID | Discover | Exploit | Privilege | Interaction | Likelihood | C | I | A | Business | Impact | Risk | Severity | Label |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **SIM-WEB-001** | 3 | 4 | 4 | 4 | **4** | 4 | 3 | 2 | 4 | **3** | **12** | **High** | Simulated |
| **SIM-WEB-002** | 3 | 3 | 4 | 2 | **3** | 3 | 3 | 1 | 3 | **3** | **9** | **High** | Simulated |
| **SIM-WEB-003** | 4 | 4 | 4 | 4 | **4** | 2 | 4 | 3 | 4 | **3** | **12** | **High** | Simulated |
| **SIM-WEB-004** | 3 | 4 | 3 | 4 | **4** | 3 | 3 | 1 | 4 | **3** | **12** | **High** | Simulated |

