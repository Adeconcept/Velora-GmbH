# DPIA Screening: User-Level Product Analytics

---

## Status
Simulated screening, formal legal determination not performed.

---

## Proposed Processing
Velora's fictional analytics provider receives pseudonymous customer identifiers and user-level feature events to measure software usage patterns and systematically improve the product interface.

---

## Data Subjects
Velora platform customer users.

---

## Data Categories
* Pseudonymous user identifiers
* Timestamped system feature events
* Device information and browser session parameters (Assumed)
* Enterprise account links and coarse geographical location context (Assumed)

---

## Purpose
Product usage analysis, platform optimizations, and proactive feature enhancement.

---

## Screening Questions Matrix

| Question | Answer | Reason |
| :--- | :--- | :--- |
| Does the activity process personal data? | Yes (Assumed) | Pseudonymous identifiers and event sequences may still track and isolate unique records back to an identifiable natural person. |
| Does it involve evaluation, scoring, or profiling? | Yes | User-level interaction tracks and behavior patterns across the application are actively evaluated. |
| Does it systematically monitor people? | Yes | Continuous usage events are collected, cataloged, and sequenced across distinct product sessions. |
| Is the processing large scale? | Unknown | Clear metrics defining user volume and absolute event volumes were not provided for analysis. |
| Does it process special-category or criminal-offence data? | No evidence | The fictional scope does not actively include data points falling under GDPR Article 9 or 10. |
| Does it involve vulnerable people? | No evidence | No children, clinical patient profiles, or similarly vulnerable target populations are identified. |
| Does it combine data sets in an unexpected way? | Unknown | Integration paths and third-party data enrichment details remain incomplete. |
| Does it make decisions with legal or similarly significant effects? | No evidence | The current purpose is restricted to feature improvement, not automated financial eligibility, evaluation, or dynamic pricing. |
| Does it use innovative technology or create an unexpected privacy effect? | Possible | Granular user-level behavioral analysis may exceed standard user privacy expectations if corporate transparency mechanisms are weak. |
| Can people exercise access, objection, deletion, or other applicable rights? | Unknown | The precise technical rights-handling workflow with the selected vendor was not operationally evidenced. |

---

## Screening Outcome
A full Data Protection Impact Assessment (DPIA) is formally recommended before enabling or expanding user-level profiling across the infrastructure. While evaluation and systematic behavior monitoring are actively present, key parameters—such as collection scale, user transparency notice loops, backend data combination, data retention limits, user rights workflows, and vendor security safeguards—remain unresolved. The designated Data Protection Officer (DPO) or a qualified privacy/legal owner must review this screening to make the final determination.

---

## Actions Before Approval
1. Document every collected behavioral tracking field and provide explicit justification for operational necessity.
2. Confirm the exact processing purpose, define the lawful basis, publish privacy notices, and configure applicable user consent choices.
3. Confirm hosting geography, validate international transfer compliance mechanisms, and inspect the vendor's subprocessor tree.
4. Explicitly define, configure, and automate data retention and localized deletion routines.
5. Verify vendor access control configuration, storage encryption keys, audit logging pipelines, automated incident notification SLA hooks, and data subject rights procedures.
6. Complete the full-scope DPIA or formally archive a reasoned legal justification from the privacy owner stating why an assessment is not mandated.

---

## Decision Status
**Escalate.** A conditional hold is placed on expanding user-level behavioral profiling pipelines until a formal privacy owner review is finalized.

---

## Limitations
All evaluation facts are entirely fictional. This screening does not constitute official legal advice and does not determine absolute GDPR regulatory compliance status.

