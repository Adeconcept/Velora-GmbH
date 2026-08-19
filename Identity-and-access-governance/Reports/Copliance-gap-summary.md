# Selected Identity Control and Compliance Gap Summary

## Assessment Objective
Evaluate the baseline authentication, lifecycle, role design, and entitlement controls governing the 71 active directory objects within the Velora Commerce GmbH tenant environment.

---

## Framework Alignment Mapping
Our findings are mapped directly against global standard frameworks to maintain audit consistency:
*   **NIST CSF v2.0:** Protect Function — Identity Management, Authentication, and Access Control (**PR.AA**)
*   **CIS Controls v8.1:** Control 5 (Account Management) and Control 6 (Access Control Management)

---

## Control Scorecard Summary

| Control ID | Target Objective | Framework Map | Design Rating | Operating Rating | Finding ID |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **CTL-04** | Enforce workforce and privileged MFA | NIST PR.AA-03 / CIS 6 | Partially Effective | Partially Effective | IAM-F-002 |
| **CTL-05** | Regular access and account lifecycle reviews | NIST PR.AA-05 / CIS 5 | Not Present | Not Present | IAM-F-001, IAM-F-003 |
| **CTL-11** | Protect sensitive data & enforce least privilege | NIST PR.DS-01 / CIS 3 | Partially Effective | Ineffective | IAM-F-005, IAM-F-006 |
| **CTL-14** | Secure programmatic service credentials | NIST PR.AA-01 / CIS 16 | Not Present | Ineffective | IAM-F-004 |

---

## Critical Compliance Discoveries

1.  **Dangling Leaver Access (IAM-F-001):** Human resources and active directory directories are un-synchronized, leaving a departed Sales representative active on the network past their termination date.
2.  **93.3% Workforce MFA Deficit (IAM-F-002):** Standard business users are completely excluded from central MFA enrollment policies, violating baseline CISA identity recommendations.
3.  **Interactive Non-Human Gateways (IAM-F-004):** Machine-to-machine service identities permit standard interactive browser authentication, introducing a severe compromise vector for engineering configurations.
4.  **Accumulated Privileges (IAM-F-005):** Mover transitions fail to purge legacy permissions, resulting in a Finance analyst holding unrevoked Support Administrator keys to customer ticketing environments.
5.  **Separation-of-Duties (SoD) Breakdown (IAM-F-006):** Single accounts contain cross-department permissions that allow them to both initiate high-value consumer refunds and self-approve the corporate transaction.
