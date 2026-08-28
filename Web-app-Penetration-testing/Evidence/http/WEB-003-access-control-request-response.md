# WEB-003 Evidence, Missing Authorization

## Authorization
- **Lab alias**: LAB-WEB-03
- **Named PortSwigger lab**: Unprotected admin functionality
- **Test date**: 2026-09-10

---

![Admin panel Accessible](https://github.com/Adeconcept/Velora-GmbH/blob/1a5a4be582b0297dcc56599309d71304fe379791/Web-app-Penetration-testing/Evidence/Screenshots/03-admin-panel-access.png)

*Figure 1. Harmless url extensions added robot.txt that reveals administration panel with redacted host and session id*


---


## Anonymous baseline
- **Authenticated**: No
- **Administrative link visible in normal navigation**: No

## Discovery
- **robots.txt requested**: Yes
- **Administrative path disclosed**: Yes
- **Published path value**: `REDACTED_ADMIN_PATH` (Disclosed text layout: `Disallow: /administrator-panel`)

## Authorization test
- **Request method and sanitized path**: `GET /administrator-panel`
- **Response status**: 200 OK
- **Administrative page returned**: Yes (HTML structure rendered the administrative panel layout interface).
- **Privileged action available**: Yes (The interface exposed buttons to delete localized application profiles).
- **Disposable lab action completed**: Yes (Executed `GET /administrator-panel/delete?username=carlos` directly as an unauthenticated user, triggering profile erasure).

## Conclusion
- **Outcome**: Fail (The server-side access control boundaries failed to block unauthorized administrative actions)
- **Root cause**: The backend application relies on security-by-obscurity (hidden URLs) instead of implementing deterministic, server-side rule enforcement filters to block unauthenticated access.
- **Minimum impact proven**: Privilege Escalation / Unauthenticated Remote Administration. A remote, unauthenticated threat actor can discover and interact with the administrative dashboard, bypassing authentication workflows to delete user profiles and disrupt operations.
- **Evidence label**: Tested on authorized training lab

