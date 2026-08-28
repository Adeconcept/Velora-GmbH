# Vulnerability Management Lifecycle

## Executive Summary
I completed a simulated business-context vulnerability-management project using one authorized Ubuntu ARM lab VM. I moved from scoping and credentialed scanning through validation, KEV and exploit-context enrichment, risk-based prioritization, remediation planning, safe changes, rescanning, and evidence-based closure.

## Business Problem
Velora's fictional critical application server relied on manual patching without an approved service target or current evidence. Leadership needed to know which findings were applicable, what should be fixed first, how availability would be protected, and whether remediation actually worked.

## Objectives
- Establish authorized and reproducible scan coverage.
- Compare unauthenticated and credentialed visibility.
- Validate scanner findings with native and authoritative evidence.
- Prioritize using severity, exploitation, exposure, criticality, impact, and controls.
- Create actionable remediation tickets and safe rollback.
- Rescan and prove closure or document residual risk.

## Environment
- MacBook M1 scanner host
- UTM Ubuntu Server ARM target (LAB-UBU-01)
- Nessus Essentials v10.12.4
- SSH credentialed checks using a dedicated non-privileged key-based identity (`nessus-audit`)
- One exact private lab IP: `192.168.XX.X` Alias `LAB-UBU-01`

## Method
Scope → Discover → Scan → Normalize → Verify → Enrich → Prioritize → Assign → Remediate → Retest → Close or Accept → Measure

## Key Results
- 1 authorized asset assessed.
- 3 scans completed: unauthenticated baseline, credentialed baseline, and post-remediation.
- Credentialed checks: **Yes, as 'nessus-audit' via ssh** (Confirmed via Plugin 19506).
- **1** actionable low-severity finding validated (`VUL-001`).
- **1** confirmed finding, **0** false positives or not reproducible issues recorded.
- **1** remediated and closed after retest.
- **0** findings mitigated, accepted, or still open.
- **100%** percent credentialed coverage and **100%** percent closure rate.

## Priority Decision
The single actionable item discovered was **VUL-001 (ICMP Timestamp Request Remote Date Disclosure)**. This was prioritized above generic informational findings because it represented a live kernel network configuration gap linked to an completely inactive host firewall (`UFW: Inactive`). While its base severity was Low, it received immediate remediation prioritization because securing host network baseline exposure represents a fundamental first step in protecting the asset's checkout business context.

## Remediation Safety
Every change used a pre-check, UTM snapshot, implementation steps, service validation, rollback, completion evidence, and a matching rescan criterion.

## Repository Contents
- `docs/`, authorization, lab, method, prioritization, remediation, limitations, and lessons
- `registers/`, asset, findings, tickets, and exceptions
- `evidence/scans/`, sanitized manual scan summaries and metadata
- `evidence/verification/`, native checks, finding validation, and change log
- `reports/`, technical assessment and executive summary

## Skills Demonstrated
Vulnerability scanning, credentialed assessment, Linux verification, CVE research, CISA KEV, CVSS and EPSS interpretation, false-positive analysis, risk-based prioritization, patching, change control, rollback, rescanning, and executive reporting.

## Limitations
One owned lab asset was tested. Nessus Essentials licensing limited normal export, and non-privileged SSH checks reduced local configuration depth. No production or unauthorized target was scanned.

