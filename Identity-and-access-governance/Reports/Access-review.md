# Identity Access Review Report

## Summary
This report evaluates standing administrative and privileged access profiles within the Velora Commerce GmbH directory, contrasting current states against our target state criteria.

---

## Objective
Assess whether selected workforce, privileged, guest, service, mover, and leaver identities have appropriate lifecycle, authentication, ownership, and application access.

---

## Population and Sample
The simulated directory contained 71 objects. A 25-object risk-based sample covered 100% of privileged workforce, departed workforce, service, and guest identities, plus ten representative standard workforce identities.

---

## Method
Nine tests evaluated employment status, MFA, guest expiry, service ownership, interactive sign-in, inactivity, privileged review, mover access, and separation of duties. PowerShell produced 24 automated exception rows, and business-role comparison added two manual exceptions.

---

## Results
*   **25** identities reviewed.
*   **27** exception rows recorded.
*   **10** IAM findings created.
*   **1 Critical, 7 High, and 2 Medium** findings identified.
*   Immediate actions required for one enabled leaver and two expired guests.

---

## Most Important Decisions
1.  **Disable the departed workforce identity** and examine application activity logs generated after the formal end date.
2.  **Remove or reapprove expired guest access** based on explicit internal sponsor validation.
3.  **Remove former-role Zendesk administration** from the Finance department mover account.
4.  **Resolve service-identity interactive access** configurations and assign named internal owners.
5.  **Review standing privilege** structures and complete 100% workforce MFA enforcement.

---

## Limitations
The data and decisions are fictional. The review used a risk-based sample and cannot prove that every unsampled standard identity is correctly configured. No production tenant or application was changed.

---

## Privileged Account Evaluation Matrix

| Identity | Current Privilege | Main Concern | Decision | Target State | Validation |
| :--- | :--- | :--- | :---: | :--- | :--- |
| **USR-001** | Entra Global Admin, AWS Admin, Splunk Admin | Broad standing privilege on a daily communication identity. | Modify | Separate administrative identity, retain only justified roles, and enforce time-limited activation where supported. | Directory role export and active PIM activation log evidence. |
| **USR-002** | Entra User Admin | Standing privilege with no historical access review records. | Modify | Scoped user administration, separate administrative identity, and mandate a quarterly access review cycle. | Directory role assignment records and quarterly review sign-off sheets. |
| **USR-003** | GitHub Admin, AWS Admin | Broad engineering privilege across separate environments. | Modify | GitHub administration retained only if justified; AWS administrative privilege must be eligible and time-limited. | System owner approval record and PIM activation log files. |
| **USR-004** | Entra Global Admin, AWS Admin | Executive corporate identity holds broad technical administrative access. | Remove or reduce | Remove routine Global Admin and AWS Admin roles; preserve approved executive access boundaries only. | Before-and-after directory role assignment export. |
| **GST-005** | Historical Splunk and AWS Read, disabled | Profile is correctly disabled; verify that no residual data tokens remain active. | Keep disabled | Maintain a hard-disabled state; ensure zero active web sessions, programmatic API keys, groups, or local access tools exist. | Downstream application configuration verification checks. |
| **SVC-001** | GitHub Service and AWS Deploy | Identity permits interactive portal sign-in combined with privileged deployment access. | Modify | Convert to a non-interactive, federated workload identity with a minimized, least-privileged deployment scope. | Sign-in block logs and cloud identity provider federation evidence. |
| **SVC-003** | RDS and S3 backup privilege | Necessary high-impact engineering workload infrastructure account. | Keep with conditions | Restrict to a non-interactive profile, assign a human owner, scope permissions strictly, monitor continuously, and review quarterly. | Verified owner field, system permission matrix, access logs, and next review date. |

## Conclusion
Privileged access should be reduced without removing the administrative capability needed to operate the business. The review therefore distinguishes unjustified breadth from legitimate administration and defines evidence for the target state.

