# Velora Engineering Remediation Log

This log lists verified configuration modifications completed on lab environment infrastructure to resolve tracked vulnerabilities.

## REM-001

### Finding
VUL-001: ICMP Timestamp Request Remote Date Disclosure

### Before state
- **Command**:
  ```bash
  sudo ufw status verbose
  ```
- **Sanitized result**:
  ```text
  Status: inactive
  ```

### Change
- **Date and time**: 2026-08-27 15:15 CEST
- **Command or configuration**: Append drop filters to `/etc/ufw/before.rules` under the `ufw-before-input` chain and execute `sudo ufw enable`.
- **Expected result**: System firewall activates cleanly, allowing port 22 while quietly dropping ICMP Type 13/14 requests.
- **Actual result**:
  ```text
  Firewall is active and enabled on system startup
  ```

### Service validation
- **Check**: Run a live verification check from the MacBook M1 host to ensure port 22 remains open and accessible.
- **Result**: SSH communication paths function normally with no latency or dropped packets.

### Rollback readiness
- **Rollback method**: Run `sudo ufw disable` via the local UTM dashboard interface console.
- **Used**: No

### After state
- **Command**:
  ```bash
  sudo ufw status verbose
  ```
- **Sanitized result**:
  ```text
  Status: active (logged)
  Logging: on (low)
  Default: deny (incoming), allow (outgoing), disabled (routed)
  New profiles: skip
  
  To                         Action      From
  --                         ------      ----
  22/tcp                     ALLOW IN    Anywhere
  22/tcp(v6)                 ALLOW IN    Anywhere(v6)               
  ```

### Rescan status
- **Status**: Passed (Verified via Scan C execution; Plugin 10114 has dropped off the tracking ledger completely).

### Evidence label
Tested on owned lab VM

---

## REM-002: Auditing Identity Clean-up & Offboarding

### Finding
Post-Assessment Credential Lifecycle Offboarding

### Before state
- **Command**:
  ```bash
  grep nessus-audit /etc/passwd
  ```
- **Sanitized result**:
  ```text
  nessus-audit:x:1001:1001::/home/nessus-audit:/bin/bash
  ```

### Change
- **Date and time**: 2026-09-04 10:00 CEST *(Post-Scan C Completion)*
- **Command or configuration**: Terminate active connections and purge the auditing profile:
  ```bash
  sudo killall -u nessus-audit
  sudo userdel -r nessus-audit
  ```
- **Expected result**: Immediate structural teardown of active SSH background tasks, home folder trees, and local user data structures.
- **Actual result**:
  ```text
  koskid@koskiddoo:/\$ sudo userdel -r nessus-audit
  userdel: user nessus-audit is currently used by process 36948
  koskid@koskiddoo:/\$ sudo killall -u nessus-audit
  koskid@koskiddoo:/\$ sudo userdel -r nessus-audit
  userdel: /home/nessus-audit home directory not found
  ```
- **Analysis Note**: Initial teardown was blocked by a lingering background processing agent spawned by the Nessus scanning framework. Running `killall -u` terminated the active session and allowed the cleanup script to finish successfully.

### Service validation
- **Check**: Confirm account termination by querying the local identity files.
- **Result**: Running `id nessus-audit` throws `no such user`.

### Rollback readiness
- **Rollback method**: Re-run the Task 8 identity generation script lines manually.
- **Used**: No

### After state
- **Command**:
  ```bash
  grep nessus-audit /etc/passwd
  ```
- **Sanitized result**:
  ```text
  # (Returns empty - no user matches found)
  ```

### Rescan status
- **Status**: Passed

### Evidence label
Tested on owned lab VM
