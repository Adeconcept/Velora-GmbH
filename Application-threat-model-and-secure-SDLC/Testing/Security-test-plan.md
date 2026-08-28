# Comprehensive Security Test Plan

This document establishes the technical parameters, environment preconditions, test structures, and pass/fail thresholds used to verify Velora's application security requirements.

## ST-001: Query Parameterization
- **Requirement**: SR-001, SR-011
- **Threats**: TM-004
- **Test Level**: Unit, integration, SAST
- **Preconditions**: Staging environment build containing the active product catalog and lookup engine code libraries.
- **Positive Case**: Submitting valid category text blocks and standard order lookup inputs must cleanly return matching database rows.
- **Negative Cases**:
  1. Injecting SQL metacharacters (`'`, `"`, `--`, `/*`, `OR 1=1`) inside the `category` dynamic input parameter.
  2. Submitting structural schema names or system table keywords outside the allowed list block.
- **Evidence**: Static code analyzer pipeline output logs, database exception tracking traces, and raw HTTP response string captures.
- **Pass Criteria**: All dynamic queries utilize parameterized variables; data payloads containing raw SQL syntax are treated strictly as literal data strings with zero interpreter logic manipulation; database error messages are completely hidden from client responses.
- **Owner**: QA Engineering & Security Analyst
- **Gate**: G3, G4
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-002: Output Encoding
- **Requirement**: SR-002
- **Threats**: TM-007
- **Test Level**: Unit, integration, DAST
- **Preconditions**: Web presentation template files built and deployed inside the target staging container.
- **Positive Case**: Standard search marker strings containing typical alphanumeric data render natively within the browser template layout.
- **Negative Cases**:
  1. Injecting unencoded HTML markup tags and client-side script payloads (`<script>`, `javascript:`, `onerror=`) inside the `search` input.
  2. Transmitting nested context-specific breaking payloads to target HTML attributes or input fields.
- **Evidence**: Burp Repeater HTTP request/response text streams, browser console alert indicators, and DOM structural tree snapshots.
- **Pass Criteria**: Special markup control characters are converted to safe HTML entities (e.g., `<` turns to `&lt;`) across all reflection contexts, and zero client-side JavaScript execution occurs inside the browser context.
- **Owner**: QA Engineering
- **Gate**: G3, G4
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-003: Authorization Matrix
- **Requirement**: SR-003
- **Threats**: TM-006
- **Test Level**: Integration, DAST
- **Preconditions**: Staging instance running active user profiles, support staff tiers, and administrative endpoints.
- **Positive Case**: An authorized corporate identity possessing valid administrative tokens can successfully access the user management panel and execute approved actions.
- **Negative Cases**:
  1. An anonymous visitor attempts to directly request the administrative endpoint path (`/administrator-panel`).
  2. A standard authenticated customer attempts to access support or administrative tracking tools.
- **Evidence**: HTTP history transaction logs, application access control decision trails, and response payload string verifications.
- **Pass Criteria**: The application server actively drops all unauthorized cross-role requests, returning a strict `401 Unauthorized` or `403 Forbidden` status code with no backend state modification.
- **Owner**: Security Analyst
- **Gate**: G3, G4
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-004: Multi-Factor Authentication Workflow State
- **Requirement**: SR-004
- **Threats**: TM-008
- **Test Level**: Integration, DAST
- **Preconditions**: Target authentication service deployed with multi-factor configurations enabled for all user profile objects.
- **Positive Case**: Providing a valid primary password followed by an accurate secondary factor code grants unhindered entry to private account areas.
- **Negative Cases**:
  1. An identity that has passed only primary password checks attempts to browse straight to protected areas, bypassing the MFA prompt route.
  2. Submitting expired, replayed, or spoofed MFA tracking tokens to secure account dashboard endpoints.
- **Evidence**: Proxy intercept request arrays, authentication session variable status logs, and redirection behavior tracking maps.
- **Pass Criteria**: The server enforces a hard lock on the session state machine, dropping connections and redirecting back to the verification prompt until the second factor is verified.
- **Owner**: Security Analyst
- **Gate**: G4
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-005: Order-Total Integrity
- **Requirement**: SR-005
- **Threats**: TM-002
- **Test Level**: Unit, integration
- **Preconditions**: Core checkout processing pipelines integrated with server-side catalog inventory reference modules.
- **Positive Case**: Submitting a standard product item selection generates accurate cart totals that match established pricing tiers.
- **Negative Cases**:
  1. Intercepting the transaction request to modify price parameters downwards before checkout.
  2. Injecting negative unit counts or non-standard currencies into the cart array payload.
- **Evidence**: Automated transaction log metrics, database invoice row summaries, and checkout pricing calculator output loops.
- **Pass Criteria**: The system ignores all client-supplied cost properties, calculating transaction totals strictly using trusted database values.
- **Owner**: QA Engineering
- **Gate**: G3, G4
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-006: Stripe Webhook Validation
- **Requirement**: SR-006
- **Threats**: TM-009
- **Test Level**: Integration
- **Preconditions**: Public webhook intake routes open on the staging container perimeter, configured with the correct endpoint secret key.
- **Positive Case**: Inbound notifications signed with valid Stripe hashes successfully update order statuses from unpaid to paid.
- **Negative Cases**:
  1. Transmitting a notification payload containing a broken or unsigned cryptographic signature string.
  2. Replaying an authentic historical webhook transaction message to force double processing.
- **Evidence**: Webhook endpoint validation logs, cryptographic trace errors, and order status state history data lines.
- **Pass Criteria**: Every webhook event is checked for signature validity, timestamp freshness, and unique ID tracking to ensure zero state modification occurs from unverified or replayed payloads.
- **Owner**: QA Engineering & Security Analyst
- **Gate**: G3, G4
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-007: Session Security
- **Requirement**: SR-007
- **Threats**: TM-001
- **Test Level**: Integration, configuration
- **Preconditions**: Session manager middleware fully initialized on the target computing server core.
- **Positive Case**: Authenticated sessions parse successfully across the storefront, maintaining stability during standard user operations.
- **Negative Cases**:
  1. Presenting an old pre-authentication session identifier after a user logs in.
  2. Attempting to use a session cookie that has passed absolute expiration or inactivity timeout windows.
- **Evidence**: HTTP header attribute configurations, browser cookie tracking files, and session storage revocation logs.
- **Pass Criteria**: Session keys are rotated upon authentication boundaries, cookies enforce `HttpOnly`, `Secure`, and `SameSite=Strict` attributes, and logout requests completely invalidate the session data block server-side.
- **Owner**: QA Engineering
- **Gate**: G4
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-008: Workforce Least Privilege
- **Requirement**: SR-008
- **Threats**: TM-012
- **Test Level**: Architecture, integration
- **Preconditions**: Microsoft Entra ID enterprise user directories synchronized with the application's role-based access maps.
- **Positive Case**: Support profiles can read specific client transaction logs while obfuscating sensitive account fields.
- **Negative Cases**:
  1. A support agent attempts to pull unmasked bulk data or execute system administrative deletion tasks.
  2. A finance user attempts to run global infrastructure environment configuration modifications.
- **Evidence**: Identity assertion logs, database query tracking trails, and role-based permissions matrix outputs.
- **Pass Criteria**: The access control model blocks cross-role data calls, and quarterly access logs confirm that permissions are limited to the minimal operational data needed.
- **Owner**: Security Analyst
- **Gate**: G2, G4
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-009: Secret Protection
- **Requirement**: SR-009
- **Threats**: TM-010
- **Test Level**: Secret scan, configuration
- **Preconditions**: GitHub repository security scanners activated with push-protection policies.
- **Positive Case**: The build runner pulls verified credentials from an encrypted cloud vault at runtime to authenticate database transactions.
- **Negative Cases**:
  1. A developer commits code containing a hardcoded plaintext API key token or cloud password parameter string.
  2. An unauthorized system identifier attempts to read data blocks directly from the cloud secret repository.
- **Evidence**: GitHub Actions compliance logs, secret vault access audit records, and repository commit rejection traces.
- **Pass Criteria**: The pipeline blocks commits containing secret markers, all environment parameters remain separated from the code tree, and rotation schedules execute without service downtime.
- **Owner**: Engineering Lead
- **Gate**: G3, G5
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-010: Audit and Alerting
- **Requirement**: SR-010
- **Threats**: TM-003, TM-011
- **Test Level**: Integration, monitoring
- **Preconditions**: CloudTrail forwarders and Splunk HTTP Event Collectors configured to parse staging container log entries.
- **Positive Case**: Authorized business events successfully write structured metadata records to our log aggregation engines.
- **Negative Cases**:
  1. Inducing sequential login failures to verify that an account-takeover alert fires in the SIEM dashboard.
  2. Tampering with log streaming data connections to ensure that connection failure alerts trigger.
- **Evidence**: JSON format log entries, Splunk alert dashboard notifications, and notification trace rows.
- **Pass Criteria**: All security events are logged with correlation tracking metadata; plaintext secrets are excluded; high-priority alerts route to the security operations team within SLA thresholds.
- **Owner**: Security Analyst & IT Manager
- **Gate**: G4, G6
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-011: Database Least Privilege
- **Requirement**: SR-011
- **Threats**: TM-004
- **Test Level**: Configuration, integration
- **Preconditions**: Explicit database schema privilege profiles and isolated application runtime roles configured.
- **Positive Case**: The standard web app service account runs valid read and write commands against approved product catalog tables.
- **Negative Cases**:
  1. The web application runtime service connection attempts to run schema modification commands (`DROP TABLE, ALTER`).
  2. The application profile attempts to query system database engine tables.
- **Evidence**: SQL privilege specification scripts, relational database grant logs, and query error reports.
- **Pass Criteria**: The database blocks the web runtime profile from executing any structural database modification commands, restricting it to specific table-level CRUD permissions.
- **Owner**: Database Admin
- **Gate**: G4, G5
- **Status**: Planned
- **Evidence Label**: Recommended until executed

---

## ST-012: Resilience Limits
- **Requirement**: SR-012
- **Threats**: TM-005
- **Test Level**: Integration, controlled performance
- **Preconditions**: Automated load-testing worker nodes provisioned to execute volumetric tests against staging infrastructure.
- **Positive Case**: The application scales resources cleanly under standard traffic volumes, meeting all availability performance goals.
- **Negative Cases**:
  1. Flooding specific search endpoints with high volumes of concurrent, massive text queries.
  2. Initiating slow, persistent HTTP connection streams to exhaust available gateway web server pools.
- **Evidence**: Resource utilization metrics (CPU/RAM charts), error rate tracking logs, and gateway connection maps.
- **Pass Criteria**: The application gateway drops traffic spikes cleanly with a 429 Too Many Requests code, protects core systems from memory exhaustion, and hides sensitive technical errors from user views.
- **Owner**: Infrastructure Lead
- **Gate**: G4, G5
- **Status**: Planned
- **Evidence Label**: Recommended until executed
