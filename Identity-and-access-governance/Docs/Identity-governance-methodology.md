# Identity Governance Assessment Methodology

This document establishes the assessment logic, testing controls, and population selection strategies for the identity review.

## Sampling Approach
The directory contained 71 in-scope objects [EV-IAM-002]. I selected 100% of privileged workforce, departed workforce, service, and guest identities because these categories carry elevated lifecycle or access risk. I then selected ten active standard workforce identities to represent Finance, People, Support, Engineering, Marketing, Sales, and Operations. The resulting 25-object sample covered 35.2% of the population.

This was a risk-based sample, not a statistical sample. It is appropriate for identifying high-risk exceptions in this fictional review but cannot prove that every unsampled standard identity is correctly configured.

---

## Access Review Test Specifications

The access review relies on nine repeatable test cases to identify identity anomalies, dictate immediate operational decisions, and flag policy exceptions.

| Test ID | Test | Expected State | Decision When Failed |
| :--- | :--- | :--- | :--- |
| **IAM-T01** | Departed workforce account status | Disabled | Disable immediately and investigate use after end date |
| **IAM-T02** | Active workforce MFA | Enforced | Remediate through controlled MFA rollout |
| **IAM-T03** | Guest end date | Future date or disabled | Remove or obtain sponsor-approved extension |
| **IAM-T04** | Service owner | Named owner | Suspend or assign accountable owner |
| **IAM-T05** | Service interactive sign-in | Blocked | Block or document time-limited technical exception |
| **IAM-T06** | Stale enabled identity | Sign-in within 45 days or valid exception | Confirm need, disable, or extend with owner approval |
| **IAM-T07** | Privileged access review | Completed within 90 days | Review privilege and remove unnecessary standing access |
| **IAM-T08** | Mover role comparison | Current access matches new role | Remove former-role access and validate new role |
| **IAM-T09** | Separation of duties | No unapproved create-and-approve conflict | Remove one permission or add independent approval control |

---

## Finding Closure Protocol

A finding can close only when:
1. The corrective action is implemented.
2. Completion evidence is retained.
3. The original failing test is rerun.
4. The retest passes or an approved exception exists.
5. The related residual risk is reassessed.
6. The reviewer records the closure date and decision.

---

### Retest Verification Specifications

| Finding | Retest Verification Steps |
| :--- | :--- |
| **IAM-F-001** | Confirm USR-005 Disabled, sessions revoked, and all in-scope applications checked. |
| **IAM-F-002** | Recalculate enforced active workforce coverage, expected 60 ÷ 60 = 100%. |
| **IAM-F-003** | Confirm GST-002 and GST-004 Disabled or have sponsor-approved future end dates. |
| **IAM-F-004** | Confirm SVC-001 and SVC-004 interactive sign-in Blocked and SVC-004 has an owner. |
| **IAM-F-005** | Compare USR-007 to ROLE-009, expected no Zendesk Admin. |
| **IAM-F-006** | Confirm USR-008 no longer holds both conflicting capabilities without independent control. |
| **IAM-F-007** | Confirm all four privileged identities have a current review and approved target role. |

