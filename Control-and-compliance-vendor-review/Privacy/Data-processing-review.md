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

