---

## DEC-004: Paid Security Services and Cost-Control Guardrails
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

