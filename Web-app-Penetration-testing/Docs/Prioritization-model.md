# Velora Commerce GmbH Custom Prioritization Model

This document defines the custom, data-driven prioritization framework used by Velora Commerce GmbH to translate technical vulnerability severity into risk-adjusted operational priorities. This is a custom portfolio model and does not copy Tenable, NIST, CISA, FIRST, or Ubuntu scoring metrics.

## 1. Six-Factor Risk Scoring Framework

An actionable security finding is evaluated across six localized operational dimensions to calculate a final Priority Score.

### Factor 1: Technical Severity Score (V)
Measures the intrinsic technical impact based on automated scanner findings or baseline CVSS metrics.

| Scanner Severity | Score |
|---|---|
| Informational | 0 |
| Low | 1 |
| Medium | 2 |
| High | 3 |
| Critical | 4 |

### Factor 2: Exploit Evidence Score (W)
Tracks real-world weaponization velocity. High scores are reserved for authoritative threat intelligence matrices.

| Evidence Criteria | Score |
|---|---|
| CVE appears in current CISA KEV Catalog | 4 |
| Vendor/authoritative source confirms active exploitation, or a reliable public exploit is confirmed | 3 |
| Public proof of concept (PoC) confirmed, no known active exploitation | 2 |
| Exploitation is plausible but no evidence was confirmed | 1 |
| No CVE or exploit evidence available | 0 |
*Note: Scores of 3 or 4 must never be assigned based on unverified blog posts or search-result headlines.*

### Factor 3: Exposure Score (X)
Evaluates the network position and reachability of the vulnerable interface.

| Network Exposure | Score |
|---|---|
| Directly internet reachable | 3 |
| Reachable from a broad internal or partner network | 2 |
| Restricted administrative or lab network | 1 |
| Not network reachable | 0 |
*Note: For this lab environment, a score of 1 is enforced unless configuration files prove wider access. The target VM is not treated as internet-facing.*

### Factor 4: Asset Criticality Score (Y)
Defines the business value of the underlying target.

| Criticality Tiers | Score |
|---|---|
| Low | 1 |
| Medium | 2 |
| High | 3 |
| Critical | 4 |
*Note: Asset AST-004 (LAB-UBU-01) is assigned a simulated business score of 4 because it directly supports production checkout functionalities.*

### Factor 5: Business Impact Score (Z)
Estimates the operational damage if the specific vulnerability is successfully exploited.

| Potential Impact | Score |
|---|---|
| Negligible operational or compliance disruption | 1 |
| Limited engineering/operational team disruption | 2 |
| Material service or confidential-data impact | 3 |
| Critical-service outage or Restricted-data compromise | 4 |

### Factor 6: Compensating-Control Score (AA)
Accounts for active layered security controls that reduce exploitability or systemic blast radius.

| Control Strength | Subtract |
|---|---|
| None evidenced / Standard defaults running | 0 |
| Partial network segmentation, privilege restriction, or temporary monitoring control | 1 |
| Strong, tested control materially limiting exploitability or operational impact | 2 |

---

## 2. Priority Calculation Formula

The quantitative calculation sums the risk enhancers and subtracts active defensive counter-measures. The possible range for an actionable finding spans from **1 to 19**.

\[\text{Priority Score} = \text{Technical Severity} + \text{Exploit Evidence} + \text{Exposure} + \text{Asset Criticality} + \text{Business Impact} - \text{Compensating Control}\]

### Spreadsheet Implementation Formulas
If tracking these six factors across columns `V` through `AA` in a calculation spreadsheet, use the following logic:

*   **Priority Score Formula (Cell AB2):**
    ```excel
    =V2+W2+X2+Y2+Z2-AA2
    ```
*   **Priority Classification Assignment (Cell AC2):**
    ```excel
    =IF(AB2>=15,"P1",IF(AB2>=11,"P2",IF(AB2>=7,"P3","P4")))
    ```

### Priority Tier Thresholds & Action SLAs

| Score Range | Priority Tier | Fictional Service Level Agreement (SLA) |
|---|---|---|
| **15 to 19** | **P1** | **7 days** to fully remediate or apply temporary mitigation |
| **11 to 14** | **P2** | **14 days** to implement patch or system configuration fix |
| **7 to 10** | **P3** | **30 days** to remediate via standard patch cycles |
| **1 to 6** | **P4** | **90 days** to remediate, or document risk acceptance track |

---

## 3. Prioritization Model Worked Training Examples
*The dataset below provides historical context to demonstrate why CVSS or scanner severity alone cannot determine final business priority. These rows are educational guidelines and are excluded from live production registers.*

| Example ID | Condition | Tech (V) | Exploit (W) | Exposure (X) | Asset (Y) | Impact (Z) | Control (AA) | Score (AB) | Priority | Label |
|---|---|---|---|---|---|---|---|---|---|---|
| **SIM-VUL-001** | Critical package CVE in KEV on application server | 4 | 4 | 1 | 4 | 4 | 0 | **17** | **P1** | Simulated |
| **SIM-VUL-002** | Unsupported web package with confirmed public exploit | 4 | 3 | 1 | 4 | 4 | 0 | **16** | **P1** | Simulated |
| **SIM-VUL-003** | SSH password authentication enabled on restricted network | 2 | 1 | 1 | 4 | 3 | 1 | **10** | **P3** | Simulated |
| **SIM-VUL-004** | Host firewall inactive, upstream lab isolation exists | 2 | 0 | 1 | 4 | 3 | 1 | **9** | **P3** | Simulated |
| **SIM-VUL-005** | Service version information disclosed internally | 1 | 0 | 1 | 4 | 1 | 1 | **6** | **P4** | Simulated |
| **SIM-VUL-006** | Self-signed certificate on local scanner interface | 2 | 0 | 0 | 1 | 1 | 1 | **3** | **P4** | Simulated |

