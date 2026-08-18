| Business service | Supporting assets | Maximum desired outage | Main security concern |
|------------------|-------------------|------------------------|----------------------|
|Customer storefront and authentication | AST-001, AST-002, AST-003, AST-004, AST-006, AST-016 | 4 hours |Account takeover, data exposure, service outage |
| Checkout and order processing | AST-001, AST-002, AST-003, AST-010, AST-016 | 4 hours | Fraud, transaction failure, database compromise |
| Customer support | AST-006, AST-007, AST-011 | 8 hours | Ticket exposure, impersonation, service disruption |
| Software development and deployment | AST-003, AST-004, AST-009 | 8 hours | Secret exposure, unauthorized code change, supply-chain compromise |
| Employee productivity and payroll | AST-006, AST-007, AST-008, AST-012, AST-017 | 24 hours | Phishing, payroll fraud, personal-data exposure |

> Identity, DNS, AWS, and the customer database are shared dependencies. A control failure affecting one of these assets can disrupt several business services, so they receive higher assessment priority.
