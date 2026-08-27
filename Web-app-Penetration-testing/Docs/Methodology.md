# Web Application Assessment Methodology

This document outlines the operational security assessment framework applied during the manual evaluation of the laboratory infrastructure. It dictates the testing sequence, analysis guidelines, and classification standards used to translate technical exploits into structured corporate risk decisions.

## 1. Assessment Style
The project was executed as a **black-box manual assessment** focused on four independent, deliberately vulnerable application environments provided by the PortSwigger Web Security Academy. No automated vulnerability scanners or automated payload generators were used. Every test request was manually crafted and analyzed within Burp Suite Community Edition.

## 2. Testing Lifecycle Workflow
Every targeted application function progresses through a strict 12-stage assessment lifecycle:
1. **Confirm authorization and exact target**: Verify that the active, temporary instance URL exactly matches the scoped laboratory session before sending traffic.
2. **Map visible pages, endpoints, inputs, roles, and workflow states**: Perform a passive walkthrough to locate parameters, query fields, configuration switches, and state conditions.
3. **Capture a normal request and response**: Send a clean transaction to Burp Repeater to serve as a baseline verification record.
4. **Form one test hypothesis**: Deduce the underlying processing logic based on parameter inputs and behavior.
5. **Modify one security-relevant element**: Change a single variable, parameter, or header string to isolate the application's input processing logic.
6. **Compare status, length, content, and application state**: Evaluate the delta between the baseline response and the test response.
7. **Reproduce once where safe**: Re-run the isolated exploit payload to confirm the behavior is stable and consistent.
8. **Stop after minimum proof**: Terminate payload injection immediately once proof-of-concept impact is achieved. Do not run destructive loops, execute deep data exfiltration, or attempt system denial-of-service.
9. **Normalize the result into a finding**: Map the technical proof directly to a standardized security vulnerability classification scheme.
10. **Rate likelihood and impact**: Calculate localized risk exposure using a transparent corporate scoring framework.
11. **Recommend a root-cause fix**: Provide developer-ready code examples and configuration patterns to eliminate the root architectural weakness.
12. **Define positive and negative retest criteria**: Specify exact operational test scripts that QA engineers or independent assessors must run to validate compliance.

## 3. Reference Standards
*   **Awareness Category Mapping:** OWASP Top 10:2025 Standard Framework.
*   **Test Reference Designations:** OWASP Web Security Testing Guide (WSTG) Stable Release.
*   **Weakness Classification:** Mitre Common Weakness Enumeration (CWE).
*   **Severity Definition:** Custom Likelihood and Impact prioritization matrix modeling business-specific constraints.

## 4. Evidence Rule
A lab completion banner confirms successful exercise completion within the training platform, but the HTTP control and test request-response logs serve as the authoritative evidence for the technical findings. Neither the tools nor the payloads used prove a real-world vulnerability within Velora Commerce GmbH production systems.
