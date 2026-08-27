# Lab Setup

## Tester workstation
- Device: MacBook M1
- Operating system: Tahoe 26.6.2 
- Burp edition: Community Edition
- Burp version: v2026 7.3
- Browser: Burp embedded browser

## Authorized targets
| Alias | Platform | Hostname in public evidence | Authorization |
|---|---|---|---|
| LAB-WEB-01 | Web Security Academy | REDACTED_LAB_HOST | PortSwigger training lab |
| LAB-WEB-02 | Web Security Academy | REDACTED_LAB_HOST | PortSwigger training lab |
| LAB-WEB-03 | Web Security Academy | REDACTED_LAB_HOST | PortSwigger training lab |
| LAB-WEB-04 | Web Security Academy | REDACTED_LAB_HOST | PortSwigger training lab |

## Burp configuration
- Native Apple Silicon installer: Yes
- Embedded browser used: Yes
- Exact active lab added to target scope: Yes
- Out-of-scope traffic hidden from view: yes
- Automated scanning used: No

## Evidence boundary
Temporary hostnames, session cookies, CSRF tokens, account identifiers, and unique lab IDs are removed from published evidence.
