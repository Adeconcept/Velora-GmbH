# Secure Software Development Lifecycle (S-SDLC) Framework

This document outlines the standard Secure SDLC activities, compliance evidence artifacts, and technical ownership boundaries implemented by Velora Commerce GmbH to embed security directly into the engineering lifecycle.

## 1. Integrated Security Lifecycle Activities Matrix

The development lifecycle enforces structured security checks across eight distinct processing phases:

| Phase | Required Security Activities | Enforcement Evidence Required | Main Owner |
| :--- | :--- | :--- | :--- |
| **Intake & Planning** | Classify features, identify systemic data assets, assess public exposure vectors, review vendor risk, and map availability thresholds. | Security Intake Record | Product Owner |
| **Requirements** | Extract applicable OWASP ASVS v5.0.0 control chapters, model contextual abuse paths, and write explicit acceptance criteria. | Approved Security Requirement Set | Product Owner & Security |
| **Design** | Update parent Data-Flow Diagrams (DFDs), map trust boundary metrics, score threat matrices, and record explicit architectural decisions. | Threat-Model Review Sign-off | Engineering Lead |
| **Build** | Enforce secure code practices, mandatory peer reviews, branch protection locks, automated secret scanning, and static code analysis (SAST). | Pull Request & CI/CD Pipeline Traces | Developer |
| **Test** | Execute security unit checks, business logic verification, negative authorization testing, automated DAST loops, and log pipeline audits. | Security Test Results Report | QA & Security |
| **Release** | Resolve blocking pipeline issues, approve time-bound exceptions, validate emergency rollback scripts, and verify cryptographic integrity. | Release Security Checklist | Engineering Lead |
| **Deploy** | Inject access configurations securely via cloud managers, apply least-privilege service roles, and check monitoring loops. | Deployment Execution Record | Engineering & IT |
| **Operate & Respond** | Monitor live log metrics, triage incoming vulnerability disclosures, run root-cause analysis, patch software, and update system models. | Splunk Alerts, Jira Incident Records | IT & Security |

---

## 2. Threat Model Re-evaluation Triggers
To prevent architectural threat models from drifting away from the live state of production infrastructure, the system design must be re-analyzed whenever any of the following eight material operational triggers occur:

1. **Edge Perimeter Alterations:** A new internet-facing endpoint, public API gateway route, or public reverse-proxy controller is introduced.
2. **Core IAM Modifications:** Material adjustments or architectural refactoring occur across user authentication, role authorization, or session tracking modules.
3. **Data Asset Expansion:** A new asset class, dynamic processing variable, or **Restricted** consumer tracking data field is added to the database tier.
4. **Trust Boundary Shifts:** A new third-party SaaS integration, external webhook listener, external API connectivity wrapper, or network trust boundary is introduced.
5. **Transactional Flow Logic Changes:** Structural re-engineering occurs across payment gateways, refund modules, checkout workflows, or automated discount logic engines.
6. **Infrastructure Pipeline Adjustments:** Significant structural changes are applied to the cloud hosting layout, container registry parameters, or continuous deployment pipelines.
7. **Vulnerability Escalation Events:** A **Critical** or **High** severity application finding is confirmed via external penetration testing or internal automated scanning pipelines.
8. **Incident Regression Discovery:** A live production security incident reveals a previously unmodeled system abuse path, threat vector, or control failure.
*   **Mandatory Operational Guardrail:** The threat model for this Critical application must be reviewed at least annually, even if no major functional code changes occur during the tracking window.

