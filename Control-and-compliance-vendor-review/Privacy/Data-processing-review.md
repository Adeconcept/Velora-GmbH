# Data Processing Review

This data-processing review evaluates the information lifecycle of personal and sensitive datasets utilized within the Velora Commerce GmbH ecosystem.

## Operational Processing Registry

The table below outlines the core processing activities, mapped to technical data identifiers, external dependencies, and identified compliance gaps.

| Processing Activity | Data ID | Purpose | Velora Role | External Party | Lawful Basis | Retention | Main Gap |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Customer account management** | DAT-001 | Create and support customer accounts | Controller (Assumed) | AWS, Zendesk | To be validated with privacy/legal owner | To be validated | Complete purpose, notice, access, retention, and processor-term review |
| **Order and payment-reference handling** | DAT-002 | Fulfil orders and reconcile payments | Controller (Assumed) | AWS, Stripe | To be validated with privacy/legal owner | To be validated | Data minimization, retention, processor roles, and payment scope need confirmation |
| **Employee and payroll administration** | DAT-003 | Employment and payroll administration | Controller (Assumed) | Personio | To be validated with privacy/legal owner | To be validated | Restricted access, retention, deletion, and processor terms need confirmation |
| **Software development** | DAT-004 | Build and operate the platform | Controller for embedded personal data (Assumed) | GitHub | To be validated with privacy/legal owner | To be validated | Prevent personal data and secrets entering repositories |
| **Customer support** | DAT-005 | Resolve customer requests | Controller (Assumed) | Zendesk | To be validated with privacy/legal owner | To be validated | Ticket minimization, attachments, deletion, and vendor assurance need review |
| **Security monitoring** | DAT-006 | Detect, investigate, and respond to security events | Controller (Assumed) | AWS, hosted Splunk | To be validated with privacy/legal owner | To be validated | Access, retention, proportionality, notice, and deletion require owner review |
| **Product analytics** | DAT-001 + pseudonymous event data (Assumed) | Understand feature use and improve the product | Controller (Assumed) | Analytics Provider (Fictional) | To be validated before user-level profiling | To be validated | DPIA screening, transparency, minimization, subprocessor, and transfer facts incomplete |

## Conclusion

The security review cannot determine Velora's lawful bases or legal retention periods from technical evidence. Those decisions require the business and privacy or legal owner. The analyst can identify missing information, technical safeguards, vendor dependencies, and evidence needed for approval.


## GDPR-Related Topics Evaluation

The table below outlines the compliance readiness review across key GDPR management principles based on evaluated operational evidence.

| Topic | Review Question | Evidence | Result | Action |
| :--- | :--- | :--- | :--- | :--- |
| **Accountability** | Are processing decisions, owners, risks, and safeguards documented? | Security Program risk assessment inventories and Compliance review | Partial | Approve owners and establish a recurring governance review cycle |
| **Data minimization** | Is only necessary data collected for each purpose? | No field-level collection specification available | Not Tested | Create a detailed field-level data inventory for analytics and support channels |
| **Storage limitation** | Are retention periods and deletion triggers approved? | EV-011 | Fail | Formally validate and document retention and deletion rules across six data sets |
| **Security of processing** | Are access, encryption, resilience, restore, and testing proportionate to risk? | EV-004, EV-006, EV-008, EV-010 | Partial | Complete planned actions for MFA enforcement, server patching, monitoring, and restore testing |
| **Processor governance** | Are processor instructions and required contract terms evidenced? | EV-012 | Fail | Obtain and legally review DPA clauses, security terms, subprocessor workflows, and incident reporting windows |
| **DPIA** | Is high-risk processing identified and assessed before deployment? | No prior screening records exist | Fail for process | Establish a formal pre-deployment screening policy and escalate the active analytics pipeline |

*Disclaimer: These evaluations represent selected technical and administrative review metrics only. This report does not classify the overall organization or its legal entity as holistically compliant or non-compliant under the General Data Protection Regulation (GDPR).*

