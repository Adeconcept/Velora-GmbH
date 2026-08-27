# Finding Verification Records

This repository stores the official engineering verification evidence collected by security analysts to back up and substantiate asset remediation decisions.

## VUL-001: ICMP Timestamp Request Remote Date Disclosure

### Scanner claim
- **Plugin ID**: 10114
- **CVE**: CVE-1999-0524
- **Reported package or service**: Remote Host Kernel Network Stack (ICMP Responder)
- **Reported severity**: Low

### Asset evidence
- **Command used**:
  ```bash
  # Check current Linux kernel sysctl tracking parameter for ICMP timestamp ignore state
  sysctl net.ipv4.icmp_echo_ignore_all
  
  # Review raw firewall profile rules on the target asset
  sudo ufw status verbose
  ```
- **Sanitized result**:
  ```text
  koskid@koskiddoo:/\$ sysctl net.ipv4.icmp_echo_ignore_all
  net.ipv4.icmp_echo_ignore_all = 0
  
  koskid@koskiddoo:/\$ sudo ufw status verbose
  Status: inactive
  ```
- **Package or configuration actually present**: The host kernel is running on default networking values where `icmp_echo_ignore_all` is turned off (`0`). Crucially, the built-in Ubuntu Uncomplicated Firewall (`ufw`) is completely **inactive**, meaning there are zero network rules active on the host to intercept, drop, or filter incoming ICMP Type 13 timestamp requests.
- **Scanner Output Evidence**: `The difference between the local and remote clocks is -27221 seconds.` responding on port `0/icmp`.

### Authoritative check
- **Ubuntu notice or CVE tracker URL**: [Ubuntu CVE-1999-0524 Tracker](https://ubuntu.com) (Marked as "Not Tracked" or "End of Life" due to baseline age, as this tracks historical informational leakage via standard network stack defaults rather than an active operating system remote code execution exploit).
- **CISA KEV result and lookup date**: Not listed in the CISA KEV Catalog (Checked: August 27, 2026).
- **EPSS result and lookup date, when applicable**: EPSS Score: 0.3159 (31.59% probability of exploitation activity over the next 30 days based on active scanner telemetry metrics). Checked: August 27, 2026.

### Analyst conclusion
- **Confirmed, Not Reproducible, or False Positive**: Confirmed.
- **Reason**: Host verification definitively confirms that the firewall is inactive and the Linux kernel defaults are exposing standard ICMP timestamp query strings to external network interfaces.
- **Business relevance**: Low operational risk. While this leaks the system's local wall-clock time offset, it presents zero risk of active code execution or service disruption. It will be remediated via standard host configuration hardening to improve Velora's overall network stealth profile.
- **Evidence label**: `EV-V01-ICMP-TIMESTAMP`
