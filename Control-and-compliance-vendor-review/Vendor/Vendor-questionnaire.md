# Third-Party Vendor Security Questionnaire

**Vendor Name:** Analytics Provider (Fictional)  
**Assigned Service:** Product Usage & Behavioral Analytics  
**Related Asset ID:** AST-018  
**Assessment Date:** 2026-08-19  

This questionnaire evaluates the security posture and data protection safeguards of the fictional analytics provider using twelve standardized criteria. 

---

## 1. Information Security Governance
*   **Question:** Who owns information security and when is the policy reviewed?
*   **Evidence Expected:** Policy extract and documented accountable role.
*   **Response Value:** **Partial**
*   **Assessor Evaluation:** The vendor supplied a general service description and baseline operational parameters, but did not provide an official policy extract or designate a named, accountable security role.

---

## 2. Hosting & Access Geography
*   **Question:** Where is Velora data hosted and from where can it be accessed?
*   **Evidence Expected:** Architecture overview and geographic location statement.
*   **Response Value:** **Yes with evidence**
*   **Assessor Evaluation:** The vendor provided an explicit "EU Hosting Statement" confirming that data storage and computational infrastructure are physically localized within European boundaries.

---

## 3. Cryptographic Controls
*   **Question:** How is data encrypted in transit and at rest?
*   **Evidence Expected:** Technical summary or cryptographic configuration evidence.
*   **Response Value:** **Yes with evidence**
*   **Assessor Evaluation:** An encryption summary was supplied by the vendor detailing that Transport Layer Security (TLS 1.3) is enforced for data in transit and Advanced Encryption Standard (AES-256) is utilized for data at rest.

---

## 4. Administrative Authentication
*   **Question:** Is MFA enforced for every privileged vendor administrator?
*   **Evidence Expected:** Multi-factor authentication (MFA) deployment coverage or technical policy evidence.
*   **Response Value:** **Unknown**
*   **Assessor Evaluation:** Evidence of mandatory MFA enforcement across the vendor's internal administrative and engineering population was not provided in the evaluation packet.

---

## 5. Security Audit Logging
*   **Question:** What security and administrative activity is logged and retained?
*   **Evidence Expected:** Logging scope matrix and event retention statement.
*   **Response Value:** **Unknown**
*   **Assessor Evaluation:** No operational details regarding administrative audit logging, log retention windows, or event generation parameters were made available for review.

---

## 6. Vulnerability Management Lifecycle
*   **Question:** How are vulnerabilities prioritized and remediated?
*   **Evidence Expected:** Vulnerability management policy, remediation target windows (SLAs), recent scan evidence, and exception tracking.
*   **Response Value:** **Unknown**
*   **Assessor Evaluation:** The vendor did not supply their internal patch management guidelines, remediation SLAs, or evidence of recent third-party vulnerability scans.

---

## 7. Incident Notification Window
*   **Question:** How quickly will Velora be notified of a personal-data or security incident?
*   **Evidence Expected:** Explicit contract clause and emergency notification process workflow.
*   **Response Value:** **No**
*   **Assessor Evaluation:** The contractual incident notification timeframe and emergency communication hooks were entirely missing from the draft agreement packet.

---

## 8. Business Continuity & Data Recovery
*   **Question:** How are continuity, backup, and recovery tested?
*   **Evidence Expected:** Active backup test summary records and programmatic action tracking.
*   **Response Value:** **Partial**
*   **Assessor Evaluation:** The vendor provided a draft availability commitment outline, but did not supply positive evidence of recent disaster recovery simulation tests or data restoration integrity checks.

---

## 9. Subprocessor Management & Transparency
*   **Question:** Which subprocessors handle Velora data and how are changes communicated?
*   **Evidence Expected:** Current downstream subprocessor list and legal change-notification mechanisms.
*   **Response Value:** **No**
*   **Assessor Evaluation:** The vendor's package lacks a formalized subprocessor hierarchy tree and contains no documented mechanism for proactively notifying Velora of downstream infrastructure changes.

---

## 10. Data Deletion & Exit Portability
*   **Question:** How is Velora data returned or deleted at termination?
*   **Evidence Expected:** Bound contract terms and formal data erasure procedures.
*   **Response Value:** **No**
*   **Assessor Evaluation:** There are zero formalized contractual deletion or return commitments present in the provided draft agreement for when the service relationship terminates.

---

## 11. Independent Compliance Assurance
*   **Question:** What independent assurance or equivalent control evidence is available?
*   **Evidence Expected:** Current third-party audit report (e.g., SOC 2 Type II), ISO certification scope, or verified alternative evidence.
*   **Response Value:** **Unknown**
*   **Assessor Evaluation:** No independent compliance certificates, third-party assessment attestations, or equivalent control audit reports were included in the vendor's packet.

---

## 12. Vendor Lock-In & Data Export Mechanics
*   **Question:** Can Velora export its data and exit the service without unreasonable dependency?
*   **Evidence Expected:** Technical data export instructions and system exit support parameters.
*   **Response Value:** **Yes with evidence**
*   **Assessor Evaluation:** The vendor supplied concrete, step-by-step product data export documentation demonstrating that Velora can programmatically retrieve its raw analytical events independently.

