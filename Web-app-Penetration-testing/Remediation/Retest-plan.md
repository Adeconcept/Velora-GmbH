# Retest Plan

## Status
Planned only. No remediated build was available because the assessed systems were PortSwigger training labs.

## Independence
Where practical, a tester who did not implement the fix should execute the security retest in staging.

## WEB-001 SQL injection
Positive test:
- Valid categories return only authorized released products.

Negative tests:
- A single quote is treated as data or safely rejected.
- The original Boolean test does not change the result set.
- Database errors are not returned to the browser.

Pass criteria:
- Response contents follow business rules for every test.
- The parameter cannot change query structure.
- Automated parameterization regression test passes.

## WEB-002 reflected XSS
Positive test:
- Normal text and expected search characters display correctly.

Negative tests:
- Harmless markup is encoded and displayed as text.
- The original alert proof does not execute.
- Response context is reviewed for HTML, attribute, URL, and JavaScript encoding correctness.

Pass criteria:
- No script execution occurs.
- Output is encoded for its exact context.
- Regression test passes with CSP enabled as defense in depth.

## WEB-003 missing authorization
Positive test:
- An authorized administrator can view and perform the approved action.

Negative tests:
- Anonymous request is rejected with 401, 403, or secure redirect.
- Standard-user request is rejected.
- Direct URL access and state-changing request are rejected server-side.

Pass criteria:
- Every privileged route and action enforces the central authorization policy.
- Unauthorized attempts are logged.

## WEB-004 2FA bypass
Positive test:
- Correct password plus correct second factor returns the account page.

Negative tests:
- Direct account URL after password-only state is rejected.
- Reused pre-authentication session is rejected after logout or timeout.
- Account identity cannot change between factors.

Pass criteria:
- Protected content is never returned before server-side second-factor completion.
- Security events are logged without secrets.

## Closure rule
A finding can be Closed only when implementation evidence exists and all relevant positive and negative retest cases pass on a remediated build.

