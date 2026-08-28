# WEB-002 Evidence, Reflected XSS

## Authorization
- **Lab alias**: LAB-WEB-02
- **Named PortSwigger lab**: Reflected XSS into HTML context with nothing encoded
- **Test date**: 2026-09-08


---

![Reflected Xss](https://github.com/Adeconcept/Velora-GmbH/blob/3fbbe6cf37af0a69ee8e92c4b63c5b03fdb5004b/Web-app-Penetration-testing/Evidence/Screenshots/02-Reflected-xss-proof.png)

*Figure 1. Minimum harmless reflected-XSS proof showing browser interpretation of unencoded input in the authorized lab, without credential access, persistence, or external communication.*


---
## Control
- **Marker**: I+-
- **Reflection location**: Reflected inside the text block of a header section element (`<h1>0 search results for 'I+-'</h1>`).
- **Encoded in response**: No (The literal alphanumeric string was returned raw to the browser).
- **Browser executed content**: No (Interpreted strictly as plain text characters within the header node).

## Harmless proof
- **Test value**: `<script>alert(1)</script>`
- **Reflection context**: Reflected directly inside the raw HTML layout body (`<h1>0 search results for '<script>alert(1)</script>'</h1>`). The application architecture dynamically echoed the payload strings without performing context-aware character entity filtering or HTML output encoding.
- **Harmless alert displayed**: Yes (The document object model parsed the unneutralized `<script>` tag as executable code, firing a localized alert popup).
- **External connection attempted**: No (The payload payload structure remained entirely localized to the origin execution space).

## Conclusion
- **Outcome**: Fail (The server-side input sanitization controls failed to filter markup characters, validating the exposure)
- **Minimum impact proven**: Client-side script injection. A remote unauthenticated threat actor can construct a malicious link containing script strings that, when visited by a targeted user, executes arbitrary code inside their session space under the application's domain origin.
- **Test stopped after**: Documented execution of the localized harmless alert function block and receipt of the application interface `is-solved` confirmation string. No cookie harvesting, session hijacking, or cross-domain callback exfiltrations were triggered.
- **Evidence label**: Tested on authorized training lab

