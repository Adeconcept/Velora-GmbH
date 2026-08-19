# Identity and Access Governance Results Dashboard

This dashboard visualizes the data outputs from our Week 19 identity review, separating raw exception volumes from final business severity ratings.

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

---

## 🔍 Visual Chart 1: Automated IAM Exceptions by Test
*(Horizontal Bar Layout)*

*   **MFA Enforcement:** 
    `██████████` **10**
*   **Stale Identity:** 
    `████` **4**
*   **Privileged Review:** 
    `████` **4**
*   **Expired Guests:** 
    `██` **2**
*   **Service Interactive Sign-In:** 
    `██` **2**
*   **Enabled Leaver:** 
    `█` **1**
*   **Service Owner:** 
    `█` **1**

---

## 📈 Visual Chart 2: IAM Findings by Severity
*(Vertical Column Simulation)*

```text
  Count ↑
    8 ┼      █
    7 ┼      █
    6 ┼      █
    5 ┼      █
    4 ┼      █
    3 ┼      █
    2 ┼      █      █
    1 ┼      █      █      █
    0 ┴──────┴──────┴──────┴────────►
          Critical High   Medium   Severity
```

---

## 🖼️ Saved Artifact Index
*   **File Path:** `evidence/screenshots/06-iam-results-and-remediation.png`
*   **Caption:** Figure 6. IAM exception and severity summary showing why an enabled leaver receives immediate priority even though incomplete MFA produces more sample rows.
