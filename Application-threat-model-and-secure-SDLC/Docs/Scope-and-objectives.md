# Scope and Rules of Engagement

## Objective
Identify, validate, prioritize, remediate, and retest vulnerabilities and security-relevant misconfigurations on one owned Ubuntu ARM lab VM.

---

## Authorization
The assessor owns and controls the Mac host and UTM Ubuntu VM. Authorization applies only to LAB-UBU-01 at the exact private IP recorded in `registers/asset-scope.csv`.

---

## Assessment Window
- Baseline: 31 August 2026
- Remediation: 3 September 2026
- Rescan: 4 September 2026

---

## In Scope
- One Ubuntu Server ARM VM
- Remote service discovery
- Nessus Basic Network Scan
- SSH credentialed package and local checks
- Ubuntu package state
- Selected service, SSH, and firewall configuration
- Safe patching, configuration, service reduction, and rescan

---

## Out of Scope
- Public targets
- Other private-network devices
- Denial-of-service testing
- Brute-force testing
- Exploitation
- Password attacks
- Malware
- Web-application scanning
- Social engineering
- Production systems
- Real customer or employee data

---

## Scan Safety
- Nessus Safe Checks remains enabled.
- The target contains one exact IP, not a subnet.
- Only one scan runs at a time.
- The UTM console remains available for recovery.
- A VM snapshot is created before credentialed scanning and remediation.
- The scan stops if the target becomes unstable or unresponsive.

---

## Credential Handling
- A dedicated lab-only SSH key is used.
- No credential, key, passphrase, or screenshot of credential fields is published.
- The temporary scan identity is removed after the final rescan.

---

## Conclusion Boundary
Results apply only to the owned lab VM at the stated time. They do not establish the security state of Velora, Ubuntu generally, or any real organization.

