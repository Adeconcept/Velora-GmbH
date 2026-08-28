# Web Application Penetration Test Report

## Executive Summary
Velora Commerce GmbH conducted an authorized manual web application penetration test across four independent, deliberately vulnerable PortSwigger training laboratory instances representing our core e-commerce functionalities. The assessment identified four critical structural security findings mapping directly to input handling failures, missing access authorization filters, and broken multi-factor authentication workflows. Manual verification confirmed that unauthenticated threat actors can bypass database constraints, run arbitrary client-side script code, access hidden management views, and completely circumvent the multi-factor security perimeter. Because these tests were executed against isolated training lab instances, no remediated application build was available for deployment testing, and all findings remain classified as Open pending a verifiable engineering build.

## Objective
The primary objective of this project is to implement, execute, and document a manual, black-box web application penetration test. This execution demonstrates attack-surface mapping, baseline analysis, targeted payload development, threat classification, risk prioritization, and developer-focused remediation engineering workflows under controlled training guidelines.

## Scope and Authorization
*   **Authorized Targets:** Four distinct, independent PortSwigger Web Security Academy Apprentice environments launched explicitly from the authorized user account profile.
*   **Assessment Dates:** September 7, 2026, through September 11, 2026.
*   **Testing Parameters:** Confined exclusively to the ephemeral, unique hostnames assigned during active testing windows.
*   **Exclusions:** Denial-of-service tests, large-scale brute forcing, data exfiltration pipelines, and multi-user interactions were strictly out of scope.
*   **Stop Conditions:** Testing was terminated immediately upon achieving minimum technical proof-of-concept for the vulnerability being evaluated.

## Environment
*   **Testing Host Platform:** MacBook Pro M1 (Apple Silicon Architecture) running macOS 15 Tahoe (v26.2).
*   **Tooling Suite:** Burp Suite Community Edition (Native M1 Installer package) utilizing Proxy Intercept and Repeater modules.
*   **Access Browser:** Chromium-based Burp Embedded Browser (v150).
*   **Target Workspace:** PortSwigger Web Security Academy infrastructure cloud wrapper.

## Methodology
The penetration test strictly executed a twelve-stage security methodology:
1. **Confirm Authorization:** Validate target host matching rules.
2. **Map Attack Surface:** Enumerate endpoints, variables, and parameters.
3. **Establish Baseline:** Capture normal transactions within Burp Repeater.
4. **Hypothesize:** Deduce underlying processing logic flaws.
5. **Isolate Variable:** Change a single dynamic input track at a time.
6. **Compare Delta:** Evaluate response code, size, and body shifts.
7. **Reproduce Minimally:** Verify exploit stability.
8. **Halt Testing:** Terminate execution once technical proof is obtained.
9. **Classify Weakness:** Map to Mitre CWE and OWASP standards.
10. **Prioritize:** Compute risk score using localized matrices.
11. **Remediate:** Design root-cause architectural fixes.
12. **Define Retest:** Document positive and negative validation specifications.

## Attack Surface
*   **Storefront Filtration Component (`/filter`):** Evaluated parameters: `category`. Trust boundary: browser to system database.
*   **Storefront Search Core Engine (`/` or `/search`):** Evaluated parameters: `search`. Trust boundary: browser to returned HTML context.
*   **Privileged Administration View (`/administrator-panel`):** Evaluated configurations: path accessibility from anonymous contexts. Trust boundary: remote public users to admin functions.
*   **Identity Access Enforcement (`/login`, `/login2`, `/my-account`):** Evaluated states: account parameters accessibility during partial authentication windows. Trust boundary: first-factor check to MFA verification state.

## Test Coverage
A 100% execution tracking rate was achieved across all four planned assessment items:

| Test Identifier | Target Description | Functional Outcome | Authoritative Evidence File Reference |
| :--- | :--- | :---: | :--- |
| **TC-WEB-001** | SQL Injection in Product Catalog Filter | **Fail** (Vulnerable) | [evidence/http/WEB-001-sqli-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-001-SQLI-request-response.md) |
| **TC-WEB-002** | Reflected XSS within Product Search Bar | **Fail** (Vulnerable) | [evidence/http/WEB-002-xss-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-002-xss-request-response.md) |
| **TC-WEB-003** | Broken Access Control on User Manager Panel | **Fail** (Vulnerable) | [evidence/http/WEB-003-access-control-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-003-access-control-request-response.md) |
| **TC-WEB-004** | Authentication Bypass via direct account path injection | **Fail** (Vulnerable) | [evidence/http/WEB-004-authentication-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-004-authentication-request-response.md) |

## Findings Summary
The manual assessment confirmed the existence of four separate vulnerabilities:

| Finding ID | Vulnerability Title | Custom Severity | OWASP Top 10 Category | Current Posture Status |
| :--- | :--- | :---: | :--- | :--- |
| **WEB-001** | SQL Injection in Product Filter Lookup | **Medium** | A05:2025 – Injection | Open, training lab |
| **WEB-002** | Reflected Cross-Site Scripting via Product Search | **Medium** | A05:2025 – Injection | Open, training lab |
| **WEB-003** | Missing Authorization Check on Admin Interface | **High** | A01:2025 – Broken Access Control | Open, training lab |
| **WEB-004** | Multi-Factor Authentication State Bypass | **Medium** | A07:2025 – Authentication Failures | Open, training lab |

---

## Detailed Findings

## WEB-001: SQL Injection in Product Filter Lookup

**Severity:** Medium (Risk Score: 12)  
**Status:** Open, training lab  
**Asset:** AST-001, simulated mapping  
**Lab:** LAB-WEB-01  
**OWASP Top 10:2025:** A05:2025 – Injection  
**WSTG:** WSTG-INPV-05  
**CWE:** CWE-89  

### Condition
The backend database abstraction engine directly appends untrusted HTTP input strings to SQL commands without parameter sanitization or pre-compilation, failing to preserve data-isolation constraints.

### Evidence
- **Control request behavior:** Transmitting clean category requests yielded standard inventory lists with a response length of 8,034 bytes.
- **Test request behavior:** Appending the sequence `' OR 1=1--` to the URL parameter altered the query logic, dumping the full table and expanding the response size to 15,392 bytes.
- **Reproduction result:** Predicable data dump reproducible across multiple Repeater cycles.
- **Evidence reference:** [evidence/http/WEB-001-sqli-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-001-SQLI-request-response.md)

### Steps to Reproduce
1. Launch LAB-WEB-01 from the PortSwigger user profile space.
2. Select an active product filter tab to capture the baseline `GET /filter?category=Clothing%2c+shoes+and+accessories` request.
3. Append the SQL control characters `' OR 1=1--` to the `category` variable.
4. Execute the request and visually identify unreleased internal development packages inside the HTML source body.

### Technical Impact
An unauthenticated network attacker can execute arbitrary database queries to bypass application logic and extract hidden product data fields.

### Simulated Velora Business Impact
Simulated: Allows competitors to map unreleased inventory structures and compromises intellectual property on AST-002.

### Severity Rationale
- **Likelihood Score and Drivers:** Score 4 (Obvious discoverability, simple parameter modification, requires zero privileged tokens, independent of user interaction).
- **Impact Score and Drivers:** Score 3 (Exposes limited sensitive data, causes no integrity modifications, zero availability impact, affects one critical customer functionality).
- Risk Score: $4 \times 3 = 12$ (High-Medium boundary mapped to Medium per corporate risk tables).

### Remediation
Enforce the use of parameterized query structures using prepared statements, and remove dynamic text interpolation patterns from data-layer managers.

### Retest Criteria
Run positive category testing coupled with negative SQL injection payloads to confirm the application processes strings as literal data inputs.

---

## WEB-002: Reflected Cross-Site Scripting via Product Search

**Severity:** Medium (Risk Score: 6)  
**Status:** Open, training lab  
**Asset:** AST-001, simulated mapping  
**Lab:** LAB-WEB-02  
**OWASP Top 10:2025:** A05:2025 – Injection  
**WSTG:** WSTG-INPV-01  
**CWE:** CWE-79  

### Condition
The front-end user presentation components echo dynamic text parameters raw inside the HTML body without running context-aware output encoding routines.

### Evidence
- **Control request behavior:** Inputting the string `|+` returned the clean text verbatim inside an `<h1>` header node.
- **Test request behavior:** Injecting the payload `<script>alert(1)</script>` forced the browser parser to run the script context directly within the active frame.
- **Reproduction result:** Stably reproduced across local browser navigation traces.
- **Evidence reference:** [evidence/http/WEB-002-xss-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-002-xss-request-response.md)

### Steps to Reproduce
1. Open the storefront search interface window inside LAB-WEB-02.
2. Input the harmless payload `<script>alert(1)</script>` into the target search field box.
3. Submit the query string and observe the localized client alert popup.

### Technical Impact
Enables the execution of untrusted JavaScript code snippets within the browser container context of a visiting consumer under the host domain origin.

### Simulated Velora Business Impact
Simulated: Threat actors can leverage this client-side execution path to harvest active authentication cookies or hijack ongoing user sessions.

### Severity Rationale

- **Likelihood Score and Drivers:** Score 3 ( Obvious discoverability clues, simple text injection vectors, but requires user interaction to click a malicious link).
- **Impact Score and Drivers:** Score 2 (Leaks single user session metrics, alters client view structures, zero server availability damage, affects a single storefront interface).
- **Risk Score:** $3 \times 2 = 6$ (Medium Severity).


### Remediation 
Apply strict HTML output entity encoding across all dynamically reflected search variables before rendering pages.

### Retest Criteria
Assert that special markup control tokens translate to text equivalents (e.g., &lt;) and ensure zero script execution paths remain active.

---

## WEB-003: Missing Authorization Check on Administrative Interface

**Severity:** High (Risk Score: 12)  
**Status:** Open, training lab  
**Asset:** AST-001, simulated mapping  
**Lab:** LAB-WEB-03  
**OWASP Top 10:2025:** A01:2025 – Broken Access Control  
**WSTG:** WSTG-ATHZ-02 
**CWE:** CWE-862  

### Condition
The application core router fails to implement server-side identity or role authorization verification rules on privileged administrative paths.

### Evidence
- **Control request behavior:** Reviewing the system file directory layout map `(/robots.txt)` revealed an administrative path reference string..
- **Test request behavior:** Querying `/administrator-panel` from an unauthenticated browser instance granted full dashboard entry with data modification buttons visible.
- **Reproduction result:** Successfully reproduced via direct URL routing manipulation.
- **Evidence reference:** [evidence/http/WEB-003-access-control-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-003-access-control-request-response.md)

### Steps to Reproduce
1. Query the base index of LAB-WEB-03 anonymously.
2. Enter `/robots.txt` into the address bar to uncover the hidden administrative path keyword value.
3. Route the browser directly to the endpoint `/administrator-panel`.
4. Trigger the administrative action button to delete user `carlos`.

### Technical Impact
Grants unauthenticated remote operators access to administrative control consoles, allowing unauthorized state changes and user directory data manipulation.

### Simulated Velora Business Impact
Simulated: Allows malicious actors to wipe corporate user registries, disrupting corporate business operations.

### Severity Rationale

- **Likelihood Score and Drivers:** Score 4 (Path clues explicitly documented, trivial browser routing execution, requires zero privileges, zero victim interaction).
- **Impact Score and Drivers:** Score 3 (No direct core systemic read access proven, but allows administrative modifications and disruptions across active production accounts).
- **Risk Score:**  $4 \times 3 = 12$ (High Severity).


### Remediation 
Deploy a centralized server-side authorization check that blocks access to privileged routes unless the user possesses a verified administrator token.


### Retest Criteria
Validate that anonymous and standard user profile requests to administrative routes are blocked with explicit `403 Forbidden` or `401 Unauthorized` responses.


---

## WEB-004: Multi-Factor Authentication State Bypass

**Severity:** Medium (Risk Score: 12)
**Status:** Open, training lab  
**Asset:** AST-001, simulated mapping  
**Lab:** LAB-WEB-03  
**OWASP Top 10:2025:** A07:2025 – Authentication Failures
**WSTG:** WSTG-ATHZ-04
**CWE:** CWE-288

### Condition
The account routing layer checks user identifiers but fails to verify that the multi-factor authentication phase has completed for the active session.


### Evidence
- **Control request behavior:** Completing first-factor authentication forced a redirect to the `/login2` multi-factor code input page.
- **Test request behavior:** Manually altering the URL routing string to target the secure endpoint `/my-account?id=carlos` bypassed the active prompt, serving up the full restricted interface.
- **Reproduction result:** Confirmed across consecutive workflow traversal tests.
- **Evidence reference:** [evidence/http/WEB-004-authentication-request-response.md](https://github.com/Adeconcept/Velora-GmbH/blob/c137ef3d98b96cc2b318970c76a648fcecd592cc/Web-app-Penetration-testing/Evidence/http/WEB-004-authentication-request-response.md)

### Steps to Reproduce
1. Input valid primary credentials for user `carlos` into the baseline login prompt view.
2. When the secondary factor verification window launches, navigate away from the field form box.
3. Manually type the target account management node path string `/my-account?id=carlos` directly into the web browser search bar.
4. Verify entry into the private dashboard space without inputting a verification code.

### Technical Impact
Enables an attacker who has compromised primary passwords to bypass multi-factor authentication checkpoints, granting complete access to private account data.

### Simulated Velora Business Impact
Simulated: Risks broad account takeover and compromises restricted customer profile information datasets.

### Severity Rationale

- **Likelihood Score and Drivers:** Score 4 (Visible path markers, simple URL string modification, requires first-factor token, independent of user interaction).
- **Impact Score and Drivers:** Score 3 (Exposes full user identity details, allows limited account state modifications, affects a critical account control node).
- **Risk Score:** $4 \times 3 = 12$ (Medium Severity)


### Remediation 

Enforce server-side session variable checks that explicitly validate the completion of the multi-factor phase before returning restricted profile dashboards.

### Retest Criteria

Verify that direct URL access requests to account profiles during an incomplete MFA session are dropped and redirected back to the login screen.

---

## Remediation Plan 

Remediation actions focus on deploying parameterized data wrappers, context-aware output encoders, and server-side authorization checks. All remediation tasks have been mapped to their respective development groups with strict SLA timelines.

## Retest Status

All verification items remain classified as Planned because no remediated application build was available within the PortSwigger laboratory environment. No vulnerability closure is claimed

## Limitations

This assessment was performed against four isolated, purpose-built laboratory instances. It excluded automated scanner operations, direct production network assessments, code repository reviews, or live client data traffic. The business context and ownership structures are simulated to support portfolio training requirements.

## Conclusion

The assessment demonstrates that hidden routes, client-side scripts, and multi-factor interfaces cannot protect an application if the backend server fails to validate input data, track session states accurately, and enforce strict authorization rules. The immediate priority is migrating from dynamic string queries to secure, parameterized data access frameworks.
