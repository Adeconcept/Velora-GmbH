# Vulnerability Management Lifecycle & Verification Methodology

This document outlines the end-to-end vulnerability management framework implemented for Velora Commerce GmbH. It defines the structured lifecycle stages, tracking states, and strict engineering rules utilized to convert automated vulnerability scan data into defensive operational actions.

## 1. Vulnerability Lifecycle Workflow
Every security defect or misconfiguration discovered on Velora assets progresses sequentially through the following 12-stage lifecycle:

1. **Scope**: Define systemic boundaries, classify target assets (e.g., AST-004 / LAB-UBU-01), and align business criticality.
2. **Discover**: Enumerate active devices, exposed listening ports, network paths, and host operating systems.
3. **Scan**: Execute automated assessments using authorized tools (Nessus Essentials v10.12.4) via authenticated and unauthenticated parameters.
4. **Normalize**: Parse raw, disparate outputs into a unified data structure matching the Velora organizational data dictionary.
5. **Verify**: Manually validate scanner deductions against local file states, runtime configs, and upstream vendor indices.
6. **Enrich**: Correlate valid items against modern exploit vectors using data feeds from CISA KEV, EPSS, and Ubuntu Security Notices.
7. **Prioritize**: Calculate localized risk exposure numbers using a blended approach of asset criticality, exploitation velocity, and exploitability.
8. **Assign**: Designate ownership to a specific, context-appropriate system administrator or engineer.
9. **Remediate**: Deploy security patches, execute code corrections, structural modifications, or configuration hardening.
10. **Retest**: Perform targeted rescan executions using identical templates to verify configuration alterations or missing software.
11. **Close or Accept**: Sign off on successful risk elimination, or transition to a time-delimited executive risk acceptance window.
12. **Measure**: Aggregate SLA performance, remediation timelines, and overall systemic exposure drift to leadership.

## 2. Definitive Vulnerability Status States

| Status | Meaning |
| :--- | :--- |
| **New** | Scanner ingestion or a manual discovery mechanism has created the initial baseline record. |
| **Validating** | A security analyst is actively compiling local package evidence and evaluating vendor advisory status. |
| **Confirmed** | Authoritative local and vendor evidence confirms the weakness exists and applies directly to the active asset configuration. |
| **False Positive** | Defensible evidence proves that the reporting detector is fundamentally incorrect or the flag does not apply. |
| **In Remediation** | A formal correction strategy has been approved, scheduled, and handed off to the asset custodian for execution. |
| **Mitigated** | Layered network perimeter modifications or compensating controls have lowered exposure, but the primary code remains. |
| **Accepted** | An authorized corporate risk owner formally signs off on carrying the residual risk across a time-limited block. |
| **Closed** | Remediation actions have been implemented, and an automated retest pass formally validates structural resolution. |
| **Reopened** | A regression occurs where a previously fixed vulnerability reappears during a modern scanning pipeline. |

## 3. Engineering Verification Rules

*   **Banner Disregard**: Never establish a final defensive decision based on a remote banner version fallback alone when authenticated local package-level verification data (`dpkg-query`, config file parsers) can be extracted.
*   **Granular Asset Verification**: Validate findings by mapping the intersection of: the targeted application package, exact sub-version string, specific Ubuntu upstream release code (e.g., 24.04 LTS Noble Numbat), port number, communications protocol, and local operating state.
*   **Upstream Vulnerability Verification**: Cross-reference all inferred Ubuntu OS discrepancies directly using the official [Ubuntu CVE Tracker](https://ubuntu.com) or [Ubuntu Security Notices (USN)](https://ubuntu.com) databases to determine true patch applicability.
*   **Exploitation Validation**: Query the [CISA Known Exploited Vulnerabilities (KEV)](https://cisa.gov) registry using the exact CVE identifier to gauge active weaponization.
*   **Exploit Probability Scoring**: Utilize the **Exploit Prediction Scoring System (EPSS)** calculation metrics strictly when a confirmed CVE mapping is present. The specific date of the EPSS lookup API query must be retained in the register logs.
*   **Deductive Failure Handling**: When an analyst fails to replicate or confirm a scan-flagged defect due to target environment quirks, record the status specifically as `Not Reproducible`. Do not label it a `False Positive` unless authoritative architectural proof shows why the scanner logic was flawed.
*   **Passive Validation Constraints**: Security analysts are strictly prohibited from writing or firing functional exploit payloads against Velora production or lab infrastructure merely to prove exposure. Local software configuration reviews, state machine mapping, and vendor-validated advisory matches represent completely sufficient proof.

