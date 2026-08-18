# Residual Risk Heatmap

This matrix visualizes the repository's residual risk posture after accounting for existing operational controls. Risks are plotted by their **Residual Likelihood** and **Residual Impact** scores.

| Impact ↓ / Likelihood → | 1: Rare | 2: Unlikely | 3: Possible | 4: Likely | 5: Almost Certain |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **5: Severe** | | R-004, R-010 | R-003, R-005 | | |
| **4: Major** | | | R-001, R-002, R-006, R-007, R-008, R-009 | | |
| **3: Moderate** | | | | | |
| **2: Minor** | | | | | |
| **1: Insignificant** | | | | | |

---

## Priority Conclusion

**R-003** and **R-005** are the two Critical residual risks. They receive immediate organizational attention because each could materially disrupt customer checkout pipelines or disaster recovery capabilities. 

**R-001**, **R-004**, and **R-006** form the next priority group because identity services, cloud storage configurations, and infrastructure cloud logging directly impact multiple downstream business systems.

---

## Risk-Register Quality Checks

The following validation checks are applied systematically to maintain the integrity of each logged entry:

* **Cause, Event, and Impact Validation:** Every risk statement must follow the structural format defining a clear technical cause, threat event, and business impact.
* **Asset Mapping:** Every risk must explicitly reference at least one stable asset ID tracked within the companion asset inventory sheet.
* **Owner Alignment:** The designated Business Owner field must structurally align with the functional department head responsible for that affected service.
* **Control Fact Check:** Every existing control entry must match verified capabilities present within the fictional dossier, avoiding hypothetical future assumptions.
* **Control Performance Impact:** Analysis must confirm whether the current control mathematically reduced likelihood, impact, both, or neither.
* **Planned Remediation Target:** The documented planned action must directly isolate and resolve the core weakness outlined in the initial risk statement.
* **Appetite Rules Enforcement:** The calculated final severity rating must dynamically trigger the specific governance action mandated by the risk methodology guidelines.

