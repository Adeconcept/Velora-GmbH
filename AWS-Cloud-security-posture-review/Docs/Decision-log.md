# Cloud Posture Architectural Decision Log

This log lists the authoritative design, risk management, and cloud safety choices established for the personal AWS learning account assessment.

---

## DEC-001: Keep Raw AWS Evidence Outside Git
- **Date:** 2026-08-29
- **Decision:** Store raw AWS CLI outputs, console configuration metadata, and CSV credential reports strictly within local `private-evidence/` subdirectories, completely excluded from version control via `.gitignore`.
- **Reason:** Raw automated output files expose sensitive production variables, including live account IDs, raw username strings, private resource ARNs, and structural session tokens.
- **Trade-off:** Potential recruiters or portfolio reviewers view sanitized, aliased data summaries and structured markdown metrics rather than raw, unredacted console proof files.
- **Label:** Tested process

---

## DEC-002: Do Not Create a Public S3 Test Bucket
- **Date:** 2026-08-29
- **Decision:** Assess existing public-access blocks and run offline policy validation models using IAM Access Analyzer instead of creating a public storage container to prove vulnerability behavior.
- **Reason:** A cloud posture assessment must not introduce unnecessary data-exposure vectors or active infrastructure risk to collect proof-of-concept evidence.
- **Label:** Recommended safety decision

---

## DEC-003: Use Event History Before Creating a Trail
- **Date:** 2026-08-29
- **Decision:** Inspect and query the automatically available, native 90-day regional Event History timeline first before provisioning a persistent multi-region trail.
- **Reason:** Provides sufficient read-only configuration evidence for baseline lifecycle audits without generating immediate, duplicate cloud delivery or ingestion costs.
- **Limitation:** Does not provide the long-term data retention, all-region aggregation, encryption keys configuration, or centralized SIEM forwarding controls required by an ongoing trail.
- **Label:** Tested and Recommended

---

## DEC-004: Treat Paid Posture Services as Optional
- **Date:** 2026-08-29
- **Decision:** Do not activate premium AWS native security monitoring tools (such as Security Hub, GuardDuty, or Config) solely to capture portfolio screenshots.
- **Reason:** Prior to turning on paid cloud services, engineers must thoroughly audit the security value, free-trial expiration limits, per-resource pricing matrices, regional scope multipliers, and clear environment exit plans.
- **Label:** Recommended

---

## DEC-005: Paid Security Services and Cost-Control Guardrails
- **Date:** 2026-08-29
- **Decision:** Explicitly defer or restrict the activation of premium AWS native monitoring services within the learning environment until formal business justification and budget allocations are approved.
- **Reason:** Prevent cost overruns from automatic trial expirations, resource-evaluation counters, or data-ingestion fees while maintaining a predictable free-tier baseline.

### Security Monitoring Service Governance Matrix

| Service | Primary Security Value | Cost Consideration Bounds | Week 23 Operational Decision |
| :--- | :--- | :--- | :--- |
| **Security Hub** | Aggregated compliance posture controls, CIS benchmark mapping, and centralized finding dashboards. | Standard free-trial windows may end and resource-based checking charges will begin automatically. | **Review pricing; optional and not required.** Do not activate for routine lab tracking. |
| **GuardDuty** | Managed continuous threat detection, intelligent machine learning anomaly tracking, and malicious IP alerting. | Trial periods may expire and variable network/data-volume processing charges will begin. | **Review pricing; optional and not required.** Relies on baseline CloudTrail analysis fallback instead. |
| **AWS Config** | Granular timeline configuration history recording and continuous rule evaluation. | Accrues active charges per configuration item recorded and per rule evaluation run. | **Do not enable solely for portfolio evidence.** Avoid due to high cost-inflation risk in active development templates. |
| **Amazon Inspector** | Automated compute workload vulnerability management, software package tracking, and network reachability audits. | Requires supported running workloads (EC2, ECR, Lambda) and incurs direct per-resource evaluation fees. | **Out of Scope.** No persistent computing instances exist within this project's review boundary. |
| **Amazon Macie** | S3 bucket data discovery, automated machine learning pattern matching, and sensitive data (PAN/PII) classification. | Global bucket inventory scanning and object data processing bytes incur heavy fees. | **Out of Scope.** Account storage tier contains zero live buckets. |
| **CloudTrail Lake** | Queryable event data store and managed SQL analytics backend. | High ingestion and data retention gigabyte storage costs run outside standard trial parameters. | **Out of Scope.** Defers to local `lookup-events` CLI text manipulation wrappers. |

### Operational Environment Safeguard Notice
If any of the premium services listed above are already active within an inherited or enterprise-managed organizational account, the analyst must review their active status and current monthly spending privately. **Operators are strictly prohibited from disabling any existing organizational security controls without explicit written authorization from the IT Manager.**

