# Assessment Limitations and Boundaries

This document defines the strict technological, licensing, and procedural boundaries of the Week 21 manual web application security assessment. These parameters ensure the results are contextualized accurately and prevent misleading security assumptions.

## 1. Environment and Target Boundaries
*   **Purpose-Built Training Labs:** The assessment was conducted strictly against four independent, deliberately vulnerable apprentice environments provided by the PortSwigger Web Security Academy. There is no claim or implication that these four architectural findings coexisted within a single consolidated application build or production environment.
*   **No Real-World Testing:** No testing was performed against actual, production-grade Velora Commerce GmbH infrastructure or any third-party public web asset. All business associations, asset classifications, data labels, and remediation assignments are entirely simulated portfolio context.
*   **Volatile In-Scope Assets:** Testing relied on unique, ephemeral cloud hostnames and temporary session tokens. All active target vectors, tracking artifacts, and laboratory instances were disposed of and deactivated immediately upon completing the manual execution blocks.

## 2. Tooling and Methodology Constraints
*   **Manual Feature Set Constraints:** Assessment operations were limited exclusively to the manual features of Burp Suite Community Edition (Proxy Intercept and Repeater modules). Automated vulnerability scanning, high-velocity fuzzing engines, and automatic reporting frameworks were entirely unavailable.
*   **Black-Box Analysis and Visibility:** The assessment was performed from a pure external, unprivileged black-box perspective. The analysis lacks the deep security insight of static application source-code reviews, infrastructure architecture diagrams, software dependency composition analyses, comprehensive API inventories, or active production log telemetry.
*   **Minimum Technical Proof Threshold:** Payloads were meticulously restricted to achieving a minimum proof-of-concept impact. Testing operations ceased immediately upon verifying data leakage or workflow circumvention, intentionally avoiding destructive database table extraction, persistent exploitation footprints, denial-of-service tests, or external callback tracking.

## 3. Posture and Reporting Restrictions
*   **Remediated Build Unavailable:** Because the underlying test targets are managed third-party laboratory environments, no remediated application builds could be compiled or deployed. Consequently, all tracking entries inside the findings register remain marked as Open, while all engineering corrections and retest workflows are categorized strictly as Recommended and Planned.
*   **Custom Risk Scoring Model:** The prioritization scores reflect a localized, qualitative likelihood and impact matrix modeled around simulated business parameters. They cannot be treated as official FIRST CVSS vectors, PortSwigger platform severity scores, or standardized OWASP category severities.
*   **Restricted Coverage Map:** The completed four test sequences do not represent a comprehensive web application security audit. The coverage metrics are a small subset of the extensive OWASP Web Security Testing Guide (WSTG) control matrix and cannot be generalized to certify the security of any broader corporate application ecosystem.
