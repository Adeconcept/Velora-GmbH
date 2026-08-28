# WEB-004 Evidence, 2FA Workflow Bypass

## Authorization
- **Lab alias**: LAB-WEB-04
- **Named PortSwigger lab**: 2FA simple bypass
- **Test date**: 2026-09-10

---

![Auth finding](https://github.com/Adeconcept/Velora-GmbH/blob/9aadcdee0d2c4e884da31a61b49385d397d507a6/Web-app-Penetration-testing/Evidence/Screenshots/04-authentication-finding.png)

*Figure 1. Server-side enforcement failures reproduced in disposable training labs, anonymous protected account access before second-factor completion.*


---

## Normal control
- **Tester password accepted**: Yes
- **Tester prompted for 2FA**: Yes
- **Account page unavailable before valid 2FA**: Yes
- **Account path after valid 2FA**: `REDACTED_ACCOUNT_PATH` (Verified parameter: `/my-account?id=wiener`)

## Bypass test
- **Lab-supplied victim password accepted**: Yes (Logged in using credentials for user `carlos`)
- **Victim 2FA completed**: No (Left the browser view suspended at the `/login2` second-factor input prompt block)
- **Direct account path requested**: Yes (Manually modified the URL line in the address window to target `/my-account?id=carlos`)
- **Protected account page returned**: Yes (The application cleanly loaded the user dashboard, bypassing the active 2FA check step entirely).

## Conclusion
- **Outcome**: Fail (The multi-factor authentication workflow state machine failed to block access)
- **Minimum impact proven**: Complete Authentication Bypass. A threat actor possessing a target's primary credentials can completely circumvent the multi-factor authentication layer, gaining full access to the victim's session space and personal information.
- **Brute force used**: No
- **Evidence label**: Tested on authorized training lab

