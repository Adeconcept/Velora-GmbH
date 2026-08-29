# AWS Shared Responsibility Matrix

This document defines the clear operational demarcations between the cloud infrastructure provider (AWS) and the customer tenant (Velora Commerce GmbH) across the current assessment parameters.

| Architectural Layer | AWS Shared Responsibilities | Customer Operational Responsibilities | Week 23 Posture Verification Check |
| :--- | :--- | :--- | :--- |
| **Physical Facilities & Hardware** | Protect data center availability, secure bare-metal server configurations, and maintain physical environmental perimeters. | Select context-appropriate deployment regions and explicitly understand inherited infrastructure controls. | Documented, not tested. |
| **Managed Control Plane** | Operate virtualization hypervisors, manage API routing architectures, and patch underlying utility operating systems. | Configure corporate user identities, implement strong IAM policies, toggle global logging engines, and enforce data encryption rules. | IAM identity checks and multi-region CloudTrail auditing tracks. |
| **S3 Storage Services** | Maintain extreme data durability properties, protect compute grid components, and secure underlying object storage APIs. | Define granular bucket access control lists, enforce explicit resource policies, mandate bucket versioning, and apply log retention rules. | S3 storage posture checklist validation audits. |
| **Identity & Access Management** | Guarantee high availability of global identity resolution grids and enforce secure cryptographic signing structures. | Implement hardened root protection controls, set up corporate directory federation, manage user credentials, and enforce least privilege. | IAM security configuration and credential report checks. |
| **CloudTrail Telemetry Engine** | Operate continuous event-tracking logging capture pipelines and maintain integrity tracks for raw audit records. | Define the scope of trails, protect destination bucket security, establish continuous alerting metrics, and manage retention cycles. | CloudTrail multi-region coverage and audit log checks. |
| **Application & Local Data** | Provide tenant isolation boundaries and ensure local hypervisor memory space remains un-contaminated. | Write clean, secure code wrappers, keep secrets outside repos, enforce data type classifications, and manage system disaster recovery tracks. | Explicitly linked to Week 22 threat models and Week 24 hardening scripts. |

