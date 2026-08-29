# Modeling Assumptions and Assessment Limitations

This document defines the systemic assumptions, structural guardrails, and technical limitations bounding this AWS Cloud Security Posture Review.

## 1. Assumptions
*   **Primary Region Mapping:** Velora's simulated production account operates primarily within the `eu-central-1` (Frankfurt) region envelope [Assumed].
*   **Storage Asset Representation:** The analyzed asset alias `S3-01` serves as a proxy representing `AST-005` database backup storage [Simulated].
*   **Telemetry Shipping Trajectory:** Selected high-risk management events generated in the cloud control plane should eventually forward to the hosted Splunk destination (`AST-014`) [Assumed].
*   **Scale and Environment Discrepancy:** The personal AWS learning account used for data collection is structurally smaller and less complex than a live enterprise-scale production environment [Observed].
*   **Governance Mapping Parameters:** All assigned infrastructure owners, target remediation dates, and operational workflows are entirely simulated portfolio context [Simulated].

## 2. Limitations
*   **Evidence Collection Vantage Point:** Review evidence originates strictly from a personal learning account, not from Velora Commerce GmbH or an active employer environment [Tested].
*   **Non-Destructive Posture Posture:** No destructive exploitation, privilege escalation testing, credential stuffing, or availability denial-of-service simulations were executed [Tested].
*   **Service and Region Scope Constraints:** Only authorized services and specific, explicitly checked regions were reviewed during the assessment window [Tested].
*   **Manual Intent Dependencies:** Some cloud security controls require manual business-intent validation and stakeholder interviews to determine absolute contextual fitness [Tested].
*   **CloudTrail Event History Boundaries:** Default CloudTrail Event History contains management events for a limited, recent 90-day rolling period and is strictly region-specific [Observed].
*   **Data Events Deferral:** Data events (such as S3 object-level GET/PUT records) were not enabled merely to generate portfolio evidence due to cost constraints [Tested].
*   **Paid Security Services Exclusions:** Advanced monitoring tools, including AWS Security Hub, Amazon GuardDuty, AWS Config, Amazon Inspector, Amazon Macie, and CloudTrail Lake, were treated as optional or completely out of scope [Tested].
*   **Infrastructure Depth Restrictions:** No full network topology mapping, computing workload analysis, container registry reviews, serverless configuration validation, database engine tuning, KMS key lifecycle checks, or disaster-recovery failover testing was completed [Tested].
*   **Resilience Assurance Limits:** Validating S3 versioning configurations does not prove true data or backup restorability. Structural recovery verification is deferred to specific Week 24 testing blocks [Tested].
*   **Static Policy Checking Limitations:** Passing an offline IAM Access Analyzer policy validation check ensures structural syntax correctness but does not prove the policy enforces business-appropriate least privilege [Tested].
*   **Compliance Framework Caveats:** No formal AWS Well-Architected, CIS Benchmark, PCI DSS, ISO 27001, or regulatory compliance certification is claimed [Tested].
*   **Point-in-Time Metric Constraint:** Collected evidence represents a static point-in-time snapshot and can become instantly stale following subsequent cloud configuration changes [Tested].

