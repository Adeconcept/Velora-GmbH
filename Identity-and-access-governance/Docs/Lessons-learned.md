# Lessons Learned

### Why did you sample 100% of privileged, leaver, service, and guest identities?
These four specific directories represent elevated lifecycle and access risk categories that standard statistical sampling can easily miss. Privileged administrators hold massive technical blast radiuses, leavers threaten data exfiltration if unpurged, and guests or service accounts frequently lack ownership and expiration controls. Auditing 100% of these critical vectors ensures full baseline visibility into our most immediate corporate exposure points.

---

### Why is MFA registration different from MFA enforcement?
MFA registration means an end-user has successfully paired an authentication method, such as an app or phone number, to their identity profile. MFA enforcement means a centralized security policy, like Microsoft Entra Conditional Access, actively requires that registered method before letting the user log in. Without policy enforcement, a user can bypass the second factor entirely, neutralizing the defense.

---

### Why can one identity create several exception rows?
A single user identity can break multiple distinct organizational security rules simultaneously. For instance, a single programmatic service account can simultaneously lack a human owner, be misconfigured to permit interactive web sign-ins, and be classified as operationally stale. Generating separate exception rows per test ensures that our technical teams track and remediate each root configuration error completely.

---

### Why could the enabled leaver be more urgent than ten MFA exception rows?
Ten MFA rows represent a widespread design gap that requires a planned, multi-department deployment to correct without disrupting day-to-day work. Conversely, an enabled leaver account is an immediate operational emergency because it means a former employee or an attacker still holds an open back door into corporate data. If log data reveals sign-ins occurring after the official termination date, it signals a potential active breach that must be blocked instantly.

---

### What should happen when a manager selects Keep but gives no reason?
If a manager selects the 'Keep' option during an access review but leaves the business justification field completely blank, the review should automatically flag the item as an incomplete submission. Without an explicit, written operational reason, the entry cannot satisfy non-repudiation or compliance tracking requirements. The auditor must reject the submission, enforce a warning, and keep the task open until a valid business reason is provided.

---

### Why must mover access remove old permissions instead of only adding new ones?
If a company only adds new permissions during role changes without purging old ones, employees will accumulate excess access over time as they move across departments. This process failure is known as 'permission creep' and results in standard users holding massive, unnecessary data access privileges. Stripping legacy privileges during transfers guarantees that the employee continues to operate within the strict boundaries of least privilege.

---

### Why should service identities not be evaluated like human MFA users?
Service identities represent non-human machine-to-machine integrations or automated software pipelines that execute code without human intervention. They cannot interactively respond to a standard multi-factor prompt, such as typing a phone code or scanning a fingerprint. Instead, service identities must be protected through workload identity controls, certificate-based secrets, managed identity rules, and strict interactive block policies.

---

### What evidence would close IAM-F-001, IAM-F-005, and IAM-F-007?
To close **IAM-F-001** (Leavers), I would require an active Entra directory change log showing the account is set to disabled alongside an application checklist confirming downstream SaaS session revocation. For **IAM-F-005** (Movers), I would inspect a user profile permission dump verifying that Zendesk administrative rights have been completely stripped from the employee's security groups. For **IAM-F-007** (Privileged Review), I would mandate the delivery of a signed quarterly attestation record paired with an Entra PIM configuration report showing that permanent roles have been transitioned to eligible, time-bound activations.

---

### What limitation prevents you from generalizing the sample to all 56 standard users?
We cannot generalize our findings because we used a targeted, risk-based sampling method rather than a mathematically random, statistical selection. A risk-based sample deliberately selects specific departments, movers, or anomalies to uncover high-impact flaws, which skews the data. While this approach is perfect for finding hidden exceptions in high-risk categories, it cannot statistically predict the precise baseline error rate across the remaining unsampled employees.

