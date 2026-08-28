# Baseline-versus-Rescan Evaluation Table

The following table provides a comprehensive comparative evaluation mapping the transition of target asset LAB-UBU-01 (AST-004) from its unauthenticated baseline to its hardened post-remediation posture.

| Metric | Unauthenticated Baseline (Scan A) | Credentialed Baseline (Scan B) | Post-Remediation (Scan C) | Analytical Interpretation |
| :--- | :---: | :---: | :---: | :--- |
| **Critical** | 0 | 0 | 0 | **Do not compare Scan A and B as equivalent coverage.** No critical code vulnerabilities were found via external network probes or internal package reads. |
| **High** | 0 | 0 | 0 | **Compare Scan B and C most directly.** The application packages and underlying libraries remain free of severe unpatched vulnerabilities across both authenticated checks. |
| **Medium** | 0 | 0 | 0 | **Explain new or persistent findings.** No configuration regressions, service drift, or persistent internal flaws were flagged during the lifecycle. |
| **Low** | 1 | 1 | 0 | **Track but prioritize by context.** Mapped to `VUL-001`. The network date disclosure was entirely neutralized by dropping the target inbound packets at the host firewall layer. |
| **Credentialed Checks**| No | Yes | Yes | **Required for package-level confidence.** Validates that the scanner successfully maintained trusted SSH communications to pull accurate system inventory reports. |
| **Confirmed Findings** | N/A | 1 | 0 | **Analyst-verified, not scanner count alone.** Tracks true verified risk posture (`VUL-001`) rather than the raw, non-actionable informational discovery counts. |
| **Closed after Retest** | N/A | N/A | 1 | **Must meet closure evidence rule.** Formally closed because the netfilter configuration was validated manually and the original plugin fell off the ledger. |


