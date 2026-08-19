# Identity and Access Governance Results Dashboard

This dashboard visualizes the data outputs from our Week 19 identity review, separating raw exception volumes from final business severity ratings.

---

![Result](https://github.com/Adeconcept/Velora-GmbH/blob/4c536093573c6d84a58503abc327903972614d5a/Identity-and-access-governance/Evidence/Screenshots/03-iam-results-and-remediation.png)
*Figure 1. IAM exception and severity summary showing why an enabled leaver receives immediate priority even though incomplete MFA produces more sample rows.*


---


## 📊 Summary Configuration Table

| Chart 1: Automated Exceptions by Test | Count | Visual Distribution | | Chart 2: IAM Findings by Severity | Count | Visual Bar |
| :--- | :---: | :--- | :---: | :--- | :---: | :--- |
| **MFA Enforcement** | 10 | `████████████████████` (41.7%) | | **Critical** | 1 | `█` (10.0%) |
| **Stale Identity** | 4 | `████████░░░░░░░░░░░░` (16.7%) | | **High** | 7 | `███████` (70.0%) |
| **Privileged Review** | 4 | `████████░░░░░░░░░░░░` (16.7%) | | **Medium** | 2 | `██` (20.0%) |
| **Expired Guests** | 2 | `████░░░░░░░░░░░░░░░░` (8.3%) | | | | |
| **Service Interactive Sign-In** | 2 | `████░░░░░░░░░░░░░░░░` (8.3%) | | | | |
| **Enabled Leaver** | 1 | `██░░░░░░░░░░░░░░░░░░░` (4.2%) | | | | |
| **Service Owner** | 1 | `██░░░░░░░░░░░░░░░░░░░` (4.2%) | | | | |
| *Total Automated Exceptions* | *24* | *(100.0%)* | | *Total Systemic Findings* | *10* | *(100.0%)* |

