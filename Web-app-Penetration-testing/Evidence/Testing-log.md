# Manual Penetration Testing Log

This log documents the sequential manual test cases executed against the authorized laboratory target instances.

## LOG-WEB-001
- **Date and time**: 2026-09-08 10:15 CEST
- **Tester**: Security Analyst (MacBook M1 / macOS 15 Tahoe v26.2)
- **Lab alias**: LAB-WEB-01
- **Test ID**: TC-WEB-001
- **Authorization confirmed**: Yes
- **Exact host in private scope record**: Yes
- **Authentication state**: Unauthenticated / Anonymous
- **Baseline action**: Submitting a standard HTTP GET request targeting the product category filter endpoint (`/filter?category=Clothing%2c+shoes+and+accessories`).
- **Changed element**: Appended SQL injection sequence `' OR 1=1--` to the `category` URL parameter string.
- **Expected secure result**: The application server enforces strict type validation or parameterized input sanitization, returning a `400 Bad Request` error or filtering the special characters to display a standard unvulnerable page layout.
- **Actual result**: The application database engine processed the raw appended text string directly, executing an unfiltered `WHERE` clause evaluation that dumped the full product catalog table.
- **Outcome**: Fail (Vulnerability Confirmed)
- **Stop point**: Ceased injection immediately upon visual identification of unreleased catalog inventory objects and receipt of the `is-solved` tracking header flag.
- **Evidence file**: `evidence/http/WEB-001-sqli-request-response.md`
- **Evidence label**: Tested on authorized training lab

---

## LOG-WEB-002
- **Date and time**: 2026-09-08 11:30 CEST
- **Tester**: Security Analyst (MacBook M1 / macOS 15 Tahoe v26.2)
- **Lab alias**: LAB-WEB-02
- **Test ID**: TC-WEB-002
- **Authorization confirmed**: Yes
- **Exact host in private scope record**: Yes
- **Authentication state**: Unauthenticated / Anonymous
- **Baseline action**: Submitting an alphanumeric search query marker string (`|+`) to the application storefront main search parameter.
- **Changed element**: Injected an unencoded HTML markup sequence payload (`<script>alert(1)</script>`) directly into the `search` URL parameter string.
- **Expected secure result**: The application filters markdown control tokens or performs context-aware HTML entity output encoding (`&lt;script&gt;`), rendering the string safely as plain text text context.
- **Actual result**: The unencoded characters were reflected raw into the DOM layout, forcing the web browser engine to interpret and run the executable script block.
- **Outcome**: Fail (Vulnerability Confirmed)
- **Stop point**: Halted testing immediately upon confirming local execution of the harmless client-side JavaScript alert box popup.
- **Evidence file**: `evidence/http/WEB-002-xss-request-response.md`
- **Evidence label**: Tested on authorized training lab

---

## LOG-WEB-003
- **Date and time**: 2026-09-10 14:00 CEST
- **Tester**: Security Analyst (MacBook M1 / macOS 15 Tahoe v26.2)
- **Lab alias**: LAB-WEB-03
- **Test ID**: TC-WEB-003
- **Authorization confirmed**: Yes
- **Exact host in private scope record**: Yes
- **Authentication state**: Unauthenticated / Anonymous
- **Baseline action**: Inspecting the application routing defaults by requesting the standard deployment map file (`/robots.txt`).
- **Changed element**: Directly targeting the exposed administrative panel folder tree (`/administrator-panel`) from an anonymous browser session.
- **Expected secure result**: The server-side authorization architecture validates access tokens, issuing an explicit `401 Unauthorized` block or forcing a hard login redirection step.
- **Actual result**: The application server granted full access to the privileged management view, allowing an unauthenticated user to successfully execute user profile erasure queries.
- **Outcome**: Fail (Vulnerability Confirmed)
- **Stop point**: Halted testing immediately upon running the single authorized deletion action against the disposable training profile account (`carlos`).
- **Evidence file**: `evidence/http/WEB-003-access-control-request-response.md`
- **Evidence label**: Tested on authorized training lab

---

## LOG-WEB-004
- **Date and time**: 2026-09-10 15:45 CEST
- **Tester**: Security Analyst (MacBook M1 / macOS 15 Tahoe v26.2)
- **Lab alias**: LAB-WEB-04
- **Test ID**: TC-WEB-004
- **Authorization confirmed**: Yes
- **Exact host in private scope record**: Yes
- **Authentication state**: First-factor password validation authenticated (`carlos`); second-factor token pending entry.
- **Baseline action**: Attempting to bypass the active `/login2` step window layout by directly requesting the home account view route using the target identifier query parameters (`/my-account?id=carlos`).
- **Changed element**: Bypassed the second-factor form interface entirely to evaluate if session data isolation state models enforce multi-factor completion boundaries before processing requests.
- **Expected secure result**: The multi-factor application access engine intercepts the direct routing request, evaluates the tracking token state as uncompleted, drops the request session, and routes back to the code entry window.
- **Actual result**: The application server completely short-circuited the multi-factor security posture, serving up the full protected account profile workspace before any code verification occurred.
- **Outcome**: Fail (Vulnerability Confirmed)
- **Stop point**: Terminated testing immediately upon validating successful unhindered navigation into the victim profile view without inputting an MFA code token.
- **Evidence file**: `evidence/http/WEB-004-authentication-request-response.md`
- **Evidence label**: Tested on authorized training lab

