# Scope and Rules of Engagement

## Objective
Assess four deliberately vulnerable PortSwigger Web Security Academy labs using controlled manual techniques and document findings in a simulated Velora Commerce business context.

## Authorization basis
PortSwigger explicitly provides the selected Web Security Academy lab instances for safe and legal security training. The tester launches each disposable instance from their own account and follows the stated lab objective.

## In scope
- One currently active temporary lab hostname at a time
- LAB-WEB-01 through LAB-WEB-04
- Manual browsing, Burp Proxy, HTTP history, and Repeater
- The exact endpoints and actions needed by the named Apprentice lab
- Lab-supplied users, data, and credentials

## Out of scope
- portswigger.net infrastructure outside the launched lab
- Other lab hostnames or users' instances
- Real organizations or applications
- Automated scanning
- Denial of service or resource exhaustion
- Credential stuffing or uncontrolled brute force
- Persistence, malware, or destructive changes outside the disposable lab objective
- Callback infrastructure and third-party services
- Production, personal, payment, employee, or customer data

## Test safety
- Use one exact lab hostname at a time.
- Keep Burp target scope limited to the active hostname.
- Use the embedded browser without personal logins.
- Establish a normal baseline before modifying a request.
- Change one meaningful value at a time.
- Use the minimum proof needed to demonstrate impact.
- Stop when the lab objective is complete.
- Do not continue exploring unrelated functions after proof.

## Stop conditions
Stop immediately if a request leaves the lab hostname, a third-party domain is contacted, the target behaves unexpectedly, the test would exceed the lab instructions, or personal information appears.

## Data handling
Do not publish cookies, CSRF tokens, temporary lab hostnames, account email addresses, browser profiles, or unique lab identifiers. Replace them with clear placeholders.

## Reporting boundary
Results apply only to deliberately vulnerable disposable labs. Velora assets, owners, impacts, priorities, and remediation workflow are simulated.
