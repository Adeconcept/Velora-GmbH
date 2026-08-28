# Scope and Objectives

## Objective
Identify and prioritize plausible design threats affecting Velora's fictional customer storefront, authentication, checkout, administration, payment integration, data stores, and logging, then convert priority threats into security requirements and verification tests.

## In scope
- Customer browser interactions
- Public application edge
- Customer web application and API
- Ubuntu application server
- Customer and order database
- Customer authentication and session state
- Workforce authentication for privileged functions
- Stripe payment creation and webhook processing
- Application and administrative logging
- CloudTrail and hosted Splunk flow
- GitHub source and deployment configuration
- Secure SDLC from requirements through vulnerability response

## Out of scope
- Real Velora systems or employees
- Full AWS network design
- Stripe internal architecture
- Microsoft Entra internal architecture
- Hosted Splunk internal architecture
- Mobile applications
- Marketing website
- Full PCI DSS scope determination
- Source-code review or penetration testing
- Exact production availability and capacity engineering

## Security objectives
1. Only authenticated and authorized users can access protected data and actions.
2. Untrusted input cannot alter database, browser, command, or template behavior.
3. Order totals and payment state are calculated and validated server-side.
4. Restricted customer and order data remains confidential and accurate.
5. External messages, including payment webhooks, are authenticated and replay-resistant.
6. Security-relevant actions are attributable and monitored.
7. Secrets and deployment configuration are protected from unauthorized access or change.
8. Critical services degrade safely and recover predictably.

## Evidence boundary
Architecture and business context are Simulated. Earlier portfolio asset IDs are reused for consistency. Week 21 lab findings are design lessons, not Velora findings.
