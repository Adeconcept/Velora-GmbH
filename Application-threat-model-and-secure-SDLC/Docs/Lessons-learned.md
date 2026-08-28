# Architectural Threat Modeling Lessons Learned

## 1. Modeling and Analysis Architecture

### Why did you draw the DFD before listing threats?
Drawing the Data-Flow Diagram (DFD) first was necessary to map the system's components, data flows, and trust boundaries before attempting to guess at risks. This visualization acts as a blueprint, allowing me to spot where data changes hands across separate administrative zones. Without this structural foundation, threat identification would become an ad-hoc, unvalidated guessing game that misses hidden entry points and data storage pathways.

### Which trust boundary created the most important design questions?
Trust Boundary 2 (External SaaS Integration Boundary) raised the most critical design questions because it governs how internal business systems ingest data from third-party ecosystems like Stripe and Entra ID. It forced us to evaluate how the application processes unauthenticated inbound traffic, such as webhooks, and how it handles third-party single-sign-on claims. Malicious manipulation at this boundary can lead to full authentication bypasses or fraudulent order validations without breaking into Velora's internal cloud subnets.

### How did Week 21 lab findings improve the Week 22 model without becoming Velora findings?
The Week 21 PortSwigger lab findings provided real-world examples of common web application vulnerabilities, which helped us ask more precise design questions for Week 22. Instead of focusing on vague issues, we used lessons learned from lab-proven flaws—like unparameterized queries and missing role checks—to design better security requirements. This approach allowed us to address potential weaknesses early in the design phase without claiming those vulnerabilities actually existed in Velora's production code.

### Why is authentication not sufficient for authorization?
Authentication simply verifies a user's identity to confirm they are who they claim to be, often by validating a password or multi-factor token. Authorization is a separate policy engine that runs after authentication to check if that specific identity has the permissions required to access a resource or run a command. An application that conflates the two might successfully authenticate a standard customer session while failing to stop them from directly loading a privileged administrative path.

### Why must a payment webhook be both authenticated and replay-resistant?
An inbound payment webhook must be authenticated using cryptographic signatures to prove the message came from the trusted payment processor rather than a malicious actor trying to spoof a transaction. It must also be replay-resistant—using unique event IDs and timestamp checks—to stop fraudsters from capturing a single valid payment message and re-sending it to approve multiple separate orders for free.

## 2. Risk Management and Security Governance

### What is the difference between a threat, a vulnerability, and a finding?
A threat is a plausible, unwanted scenario where an attacker could exploit a system design (e.g., an attacker might attempt SQL injection). A vulnerability is a verified weakness or missing control within the code that makes that threat possible. A finding is the formal documentation created after a penetration test or manual verification step confirms that a vulnerability is active and exploitable in the environment.

### Why were residual scores treated as targets?
Residual risk scores were treated as design targets because they represent the risk level we expect to achieve *after* our recommended controls are fully implemented and verified. In a professional secure development lifecycle, we cannot lower a risk score simply because a fix has been proposed in a document. The score must remain at its inherent level until a developer implements the code and an independent test proves the control works.

### Which security gate is most likely to prevent a costly late-stage change?
Gate 2 (Design Review) is the most effective gate for preventing costly late-stage remediation work because it evaluates architectural layouts *before* a single line of code is written. Fixing a fundamental design flaw—like missing multi-factor session validation or a broken database structure—takes only minutes on a diagram. If that same flaw is left undiscovered until the deployment or production testing phase, fixing it can require rewriting large portions of the core application.

### Which requirement would be hardest to verify and why?
Requirement `SR-010` (Structured Security Telemetry and Alerting) is the most difficult to verify because it requires testing end-to-end event flow across multiple independent environments. Analysts must trigger a wide variety of application and authentication failures to ensure logs format correctly without exposing secrets. We then have to verify that these logs travel securely through CloudTrail, ingest properly into Hosted Splunk, and trigger the correct alerts without creating blind spots or flooding the team with alert fatigue.

### When must this threat model be updated?
This threat model must be updated immediately whenever significant changes occur in the application's architecture or data flows, such as introducing a new public endpoint, modifying the single-sign-on token structure, or onboarding a new third-party API vendor. It must also be re-evaluated if a security incident exposes a novel, unmodeled attack path. At a minimum, this critical application requires a formal review session at least annually to account for changes in the threat landscape.
