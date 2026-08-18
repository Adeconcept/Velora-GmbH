# 90-Day Risk Treatment Plan

This plan is a sequenced and prioritized view of `registers/risk-register.csv`. It outlines tactical remediation actions over the next quarter to mitigate known vulnerabilities.

| Period | Action | Risk | Owner | Completion Evidence | Success Measure |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Days 0 to 14** | Apply interim critical-server patch review and confirm current exposure | R-003 | Engineering Lead | Patch execution report and approved patch exception log | Zero unpatched Critical-rated operating system vulnerabilities |
| **Days 0 to 14** | Perform one controlled backup restore | R-005 | IT Manager | Technical restoration log file and validation screenshots | Selected database records successfully restored and data integrity validated |
| **Days 0 to 30** | Enforce MFA for all users and block legacy authentication | R-001 | IT Manager | Configuration policy screenshot and identity provider coverage export | 100% of active corporate user accounts protected by multi-factor authentication |
| **Days 0 to 30** | Review S3 public access, encryption, policy, and logging | R-004 | CTO | Sanitized cloud configuration report and access policy audit log | Zero cloud storage buckets configured with unintended public access permissions |
| **Days 31 to 60** | Establish quarterly access review and JML checklist | R-002 | IT Manager | Formally signed access review documentation and finalized JML checklist | 100% of sampled and active identity accounts verified against current employment status |
| **Days 31 to 60** | Route and review selected high-risk CloudTrail activity | R-006 | IT Manager | Active SIEM search query string and documented log review procedure | High-risk administrative cloud changes reviewed on a daily operational cycle |
| **Days 31 to 60** | Apply Windows and Ubuntu security baselines | R-003, R-009 | IT Manager | Before-and-after baseline configuration audit compliance reports | 100% of selected endpoint and server systems satisfy the defined minimum-security benchmarks |
| **Days 31 to 60** | Enable secret scanning and define secret-storage procedure | R-010 | Engineering Lead | Repository scan results summary and approved developer secret management guide | Zero unresolved, exposed programmatic credentials or tokens within code repositories |
| **Days 61 to 90** | Run incident-response tabletop | R-007 | COO | Documented tabletop scenario slides, meeting minutes, and an action item tracker | All identified emergency action points are explicitly assigned to named operational owners |
| **Days 61 to 90** | Assess four critical vendors | R-008 | COO | Completed third-party risk assessment questionnaires and formal risk sign-offs | Four critical supplier relationships evaluated and risk decisions formally archived |

