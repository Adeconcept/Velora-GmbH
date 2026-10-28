# Authorized Web Application Penetration Test

## Executive Summary
I completed a controlled manual web application security assessment using four deliberately vulnerable PortSwigger Web Security Academy labs. The project demonstrates authorization, attack-surface mapping, HTTP request analysis, manual validation, risk-based reporting, developer remediation guidance, and independent retest design.

The labs modelled SQL injection, reflected XSS, missing authorization, and incomplete 2FA enforcement. Technical results are labelled Tested, while Velora business impact, owners, priorities, and timelines are explicitly Simulated.

## Business Problem
Velora's fictional customer application supports storefront, account, and administrative workflows involving Restricted customer and order data. Leadership needs evidence that application controls prevent untrusted input from changing interpreter behavior, unauthorized users from reaching privileged actions, and partially authenticated sessions from accessing protected resources.

## Objectives
- Establish written authorization and exact scope.
- Map relevant endpoints, inputs, roles, and trust boundaries.
- Compare baseline and controlled test behavior.
- Validate four application-security weakness classes manually.
- Map results to OWASP Top 10:2025, WSTG, and CWE.
- Prioritize findings using documented likelihood and impact.
- Give developers root-cause fixes and testable acceptance criteria.

---

## Engineering Remediation & Secure UX Fixes

Finding vulnerabilities using Burp Suite is only half the battle. As a security professional with a background in Product Design, I analyzed the root causes of these OWASP top 10 flaws and designed user-centric, secure remediation paths:
### Fixing insecure direct object references (IDOR):
- The Flaw: Changing a user ID parameter in the URL (e.g., account?id=1001 to id=1002) allowed access to another user's private dashboard.
- Secure UX Remediation: On the backend, enforce strict object-level authorization tokens. On the frontend interface, remove sequential, predictable user IDs from the URL entirely. Use clean, human-readable slug paths (e.g., /dashboard/settings) so malicious actors cannot easily guess or manipulate parameter boundaries via the browser interface.

### Mitigating broken Authentication (Session Timeout UX):
- The Flaw: Sensitive banking/SaaS accounts remained logged in indefinitely on public or shared computers because session tokens never expired.
- Secure UX Remediation: Implement an automatic 15-minute inactivity timeout. However, to prevent data loss and user frustration, deploy a subtle, low-friction countdown modal 60 seconds before expiration: "For your security, you will be logged out in 60 seconds. [Keep Me Logged In]". Clicking the button securely refreshes the token via an authenticated API call without breaking the user's active flow.

### Defending against Cross-Site Scripting (XSS) via safe inputs:
- The Flaw: Attackers injected malicious scripts into comment boxes because input validation was missing.
- Secure UX Remediation: Pair strict backend input encoding with real-time frontend field validation. Use micro-copy and placeholder text that explicitly guides the user on expected inputs (e.g., "Letters and numbers only"). If they attempt to paste unexpected special characters, dynamically disable the submit button and display a clear, helpful error message rather than letting the payload execute.

---

## Environment
- MacBook M1 scanner host
- Burp Suite Community Edition
- Burp embedded browser
- PortSwigger Web Security Academy
- Four independent temporary training labs

## Method
Authorize -> Scope -> Map -> Baseline -> Hypothesize -> Modify -> Compare -> Verify -> Classify -> Prioritize -> Recommend -> Plan retest

## Test Coverage

| Test | Weakness | Outcome | Evidence |
|---|---|---|---|
| **TC-WEB-001** | SQL injection | **Fail** | [evidence/http/WEB-001-sqli-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-001-SQLI-request-response.md) |
| **TC-WEB-002** | Reflected XSS | **Fail** | [evidence/http/WEB-002-xss-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-002-xss-request-response.md) |
| **TC-WEB-003** | Missing authorization | **Fail** | [evidence/http/WEB-003-access-control-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-003-access-control-request-response.md) |
| **TC-WEB-004** | 2FA workflow bypass | **Fail** | [evidence/http/WEB-004-authentication-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-004-authentication-request-response.md) |

## Key Results
- Planned tests: 4
- Completed tests: 4
- Confirmed lab findings: 4
- Critical: 0
- High: 1 (`WEB-003`)
- Medium: 3 (`WEB-001`, `WEB-002`, `WEB-004`)
- Low: 0
- Findings closed after remediation: 0, no remediated build was available

## Most Important Decision
`WEB-003` (Missing Authorization Check on Administrative Interface) was prioritized as the highest operational risk. This decision was driven by two key severity factors: its maximum Discoverability score (4), as the path was openly disclosed in `robots.txt`, and its trivial Exploitability score (4), which allowed anonymous browser access to state-changing functions. This finding ranked higher than `WEB-004` (2FA Workflow Bypass) because `WEB-004` required a pre-existing valid standard user password compromise to execute, lowering its baseline likelihood.

## Remediation and Retest
Each confirmed finding includes a root-cause fix, owner, target, deployment-safety considerations, positive test, negative test, and closure rule. Because the training labs could not be patched by the tester, recommendations are Planned and no finding is falsely marked Closed.

## Repository Contents
- `docs/`, scope, setup, methodology, attack surface, severity, limitations, and lessons
- `registers/`, test cases and normalized findings
- `evidence/`, sanitized HTTP summaries, testing log, and six screenshots
- `remediation/`, corrective-action and independent retest plans
- `reports/`, technical and executive reporting

## Skills Demonstrated
Rules of engagement, Burp Proxy, Repeater, HTTP analysis, SQL injection validation, reflected XSS validation, authorization testing, authentication workflow testing, OWASP mapping, CWE classification, risk rating, remediation design, retest planning, and executive communication.

## Limitations
This was an authorized lab-based project, not a client engagement. Four purpose-built labs were assessed independently, no production target or real data was tested, and no remediated build was available.
