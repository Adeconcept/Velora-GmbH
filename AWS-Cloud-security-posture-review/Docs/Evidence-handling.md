# Evidence Redaction and Data Handling Policy

This document establishes the authoritative data-handling guidelines, local storage locations, and sanitization techniques applied to evidence collected during this security posture review.

## 1. Cloud Posture Evidence Treatment Ledger

| Evidence Type | Raw Local Location | Portfolio Treatment Operational Rule | Publish to Public Git? |
| :--- | :--- | :--- | :---: |
| **Caller Identity** | `private-evidence/account/` | Record validation success, region metrics, and authentication mechanism parameters only. Remove raw strings. | **No** |
| **IAM Credential Report** | `private-evidence/iam/` | Replace physical human names with unique sequential aliases (e.g., `ID-01`, `ID-02`) and provide a status summary. | **Sanitized Summary Only** |
| **IAM Role & Policy Output**| `private-evidence/iam/` | Strip all account IDs, ARNs, custom path strings, personnel names, and tracking metadata tags. | **Sanitized Extract Only** |
| **S3 Configuration** | `private-evidence/s3/` | Replace specific DNS bucket name parameters with standardized trackers (e.g., `S3-01`, `S3-02`). | **Sanitized Checklist Only** |
| **CloudTrail Events** | `private-evidence/cloudtrail/` | Display event names, timestamps, and structural outcomes. Purge principal actors, source IPs, requested query hashes, and ARNs. | **Sanitized Table Only** |
| **Billing Evidence** | Local private evidence | Redact associated contact emails, custom spend metrics, financial methods, and core account numbers. | **Optional Sanitized Image** |
| **Findings & Decisions** | Repository CSV trackers | Map exposures using asset designations, business criticality scales, and simulated organizational impacts. | **Yes** |

## 2. Core Security Control Enforcements
*   **Redaction as a Security Control:** Data sanitization and string redaction are strictly enforced as operational security controls, not cosmetic layout steps. If a command log, output configuration, or graphic screen capture cannot be sanitized with 100% confidence, **it must be withheld from publication entirely**.

