# Application Abuse Case Scenarios

This document structures six abuse cases modeling how malicious actors target the application's design boundaries, defining the exact prevention, detection, and testing logic needed to handle each scenario.

## AC-001: Manipulate Checkout Total

### Business Function
Customer Storefront Checkout & Payment Verification Engine.

### Threat Actor and Goal
External malicious visitor or fraudulent customer whose goal is to alter the financial price parameter of an inventory item during cart submission to purchase goods for less than retail value.

### Preconditions
- Attacker has a standard consumer account and an active browser proxy configuration setup.
- The web storefront relies on client-side HTTP request data values to process the cart total.

### Abuse Path
1. The attacker adds a premium inventory item to their virtual shopping cart.
2. The attacker intercepts the checkout request via an HTTP proxy tool before it routes to the payment gateway.
3. The attacker manipulates the unit cost value down to a fraction of its cost and submits the tampered payload.
4. The server-side transaction logic processes the client-supplied parameter without server validation, letting the attacker complete a fraudulent purchase.

### Assets and Data Affected
- **Asset IDs**: AST-001, AST-002
- **Data IDs**: DAT-002 (Restricted Order & Payment Metadata)

### Prevention
- **Security Requirement IDs**: SR-005

### Detection
- **Required Event and Alert**: Generate an immediate security alert in Splunk if a discrepancy occurs between the hardcoded base-table database SKU record price and the inbound request-layer transaction parameters.

### Verification
- **Security Test IDs**: ST-005

### Evidence Labels
Simulated abuse case, Recommended controls

---

## AC-002: Access Account Before MFA Completion

### Business Function
Customer Authentication Portal & Multi-Factor Workflow State Machine.

### Threat Actor and Goal
Credential thief trying to bypass multi-factor authentication (MFA) and gain full access to a victim's private profile space using compromised primary credentials.

### Preconditions
- The threat actor possesses a valid user password but lacks access to the second-factor code or device.

### Abuse Path
1. The attacker enters the stolen primary username and password on the standard login interface.
2. The application accepts the credentials and updates the session state to require MFA code entry.
3. Instead of completing the prompt, the attacker types the direct internal routing path of the customer profile dashboard into the browser.
4. The session engine maps access permissions based on username strings rather than checking if MFA verification has completed, granting the attacker unauthorized access.

### Assets and Data Affected
- **Asset IDs**: AST-001
- **Data IDs**: DAT-001 (Restricted Customer Profile Data)

### Prevention
- **Security Requirement IDs**: SR-004

### Detection
- **Required Event and Alert**: Log an explicit authentication failure and fire an active alert flag if an application session lacking an active `mfa_verified=true` token attempts to pull from secure data endpoints.

### Verification
- **Security Test IDs**: ST-004

### Evidence Labels
Simulated abuse case, Recommended controls

---

## AC-003: Invoke Admin Function as Customer

### Business Function
Administrative Operations & Privileged Portfolio Control Dashboard.

### Threat Actor and Goal
Standard customer profile or malicious external network entity whose goal is to access administrative control portals to read or delete user directories.

### Preconditions
- The attacker knows or guesses hidden path descriptors (e.g., `/administrator-panel`) from configuration or disclosure files.

### Abuse Path
1. The attacker navigates directly to the administrative route from an unprivileged web session.
2. The application's core router checks if the endpoint matches a hidden string pattern instead of executing a server-side authorization evaluation.
3. The server serves the privileged dashboard interface page layout to the standard user session.
4. The attacker runs administrative deletion scripts, erasing account configurations across the production database.

### Assets and Data Affected
- **Asset IDs**: AST-001, AST-002
- **Data IDs**: DAT-001, DAT-002

### Prevention
- **Security Requirement IDs**: SR-003, SR-008

### Detection
- **Required Event and Alert**: Trigger a priority-1 alert inside Hosted Splunk if an identity lacking active administrative role mappings attempts to call privileged data modification routes.

### Verification
- **Security Test IDs**: ST-003, ST-008

### Evidence Labels
Simulated abuse case, Recommended controls

---

## AC-004: Extract Records Through Unsafe Query

### Business Function
Product Search Filtration Engine and Database Data Layer.

### Threat Actor and Goal
Unauthenticated network attacker whose goal is to break out of single-category query isolation bounds to exfiltrate full customer databases or read underlying database storage rows.

### Preconditions
- Target application endpoint handles dynamic data interpolation using raw string concatenation inside query generation functions.

### Abuse Path
1. The attacker opens the application product catalog view.
2. The attacker injects specialized SQL syntax payloads into dynamic category fields.
3. The database engine executes the concatenated string verbatim as a logical directive instead of plain text, bypassing intent rules.
4. The server dumps the customer profile tables directly to the attacker’s screen interface.

### Assets and Data Affected
- **Asset IDs**: AST-001, AST-002
- **Data IDs**: DAT-001, DAT-002

### Prevention
- **Security Requirement IDs**: SR-001, SR-011

### Detection
- **Required Event and Alert**: Generate an automated alert on the edge WAF whenever common SQL control characters match incoming text fields, and log data tier parsing errors inside the centralized security log registry.

### Verification
- **Security Test IDs**: ST-001, ST-011

### Evidence Labels
Simulated abuse case, Recommended controls

---

## AC-005: Execute Script Through Product Search

### Business Function
Storefront Query Processing and Front-End View Rendering Engines.

### Threat Actor and Goal
Malicious actor trying to hijack client-side browse tokens or capture session parameters by forcing a target customer's browser to execute untrusted code.

### Preconditions
- Front-end layout templates reflect dynamic query data parameters back onto user screens without performing context-aware output encoding.

### Abuse Path
1. The attacker crafts a malicious application link containing an unencoded client-side script payload inside the query parameter.
2. The attacker distributes the hyperlink to a targeted consumer using external delivery vectors.
3. The victim clicks the link, and the application reflects the payload into the browser layout context without output encoding.
4. The consumer's browser engine runs the script, letting the attacker steal their session identifier.

### Assets and Data Affected
- **Asset IDs**: AST-001
- **Data IDs**: DAT-001

### Prevention
- **Security Requirement IDs**: SR-002

### Detection
- **Required Event and Alert**: Flag incoming search strings matching explicit cross-site scripting signature vectors at the edge gateway layer before the payload reaches compute instance buffers.

### Verification
- **Security Test IDs**: ST-002

### Evidence Labels
Simulated abuse case, Recommended controls

---

## AC-006: Forge or Replay Payment Confirmation

### Business Function
Asynchronous Order Status Processing and External Payment Gateway Webhook Integrations.

### Threat Actor and Goal
Fraudulent buyer whose goal is to change an order's status from unpaid to fully paid without spending any capital.

### Preconditions
- The web application exposes a public webhook ingestion endpoint to listen for asynchronous notifications from the payment gateway.

### Abuse Path
1. The attacker commits a standard checkout sequence and captures the corresponding transaction metadata.
2. The attacker captures an authentic payment status update payload or attempts to forge a lookalike payment confirmation message.
3. The attacker re-transmits or sends the forged confirmation message directly to the public webhook endpoint, bypassing the payment gateway.
4. The backend processes the message without validating its signature or timestamp, marking the unpaid order as paid.

### Assets and Data Affected
- **Asset IDs**: AST-001, AST-002, AST-010
- **Data IDs**: DAT-002

### Prevention
- **Security Requirement IDs**: SR-006

### Detection
- **Required Event and Alert**: Log an immediate validation exception and fire a high-severity alert if an inbound webhook notification fails cryptographic signature validation checks.

### Verification
- **Security Test IDs**: ST-006

### Evidence Labels
Simulated abuse case, Recommended controls

