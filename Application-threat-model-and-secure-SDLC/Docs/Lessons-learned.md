# Project Lessons Learned & Engineering Retrospective

### 1. Remote vs. Credentialed Scanning Visibility
Credentialed scanning allows the assessment framework to query the asset's internal operating system parameters, active configuration layers, and local software installation registries natively from the inside out. An unauthenticated remote scan relies entirely on capturing exposed network banner strings, which can be easily spoofed or suppressed. By providing credentials, the engine successfully switched from network-level port guessing (`nessus_syn_scanner`) to local process mapping via the `netstat` framework, uncovering systemic settings hidden from external traffic sweeps.

### 2. Proving Credentialed Assessment Success
To definitively prove that credentialed checks succeeded, analysts must inspect the specific runtime output text block of **Nessus Plugin ID 19506 (Nessus Scan Information)**. This signature module must explicitly log the exact string: `Credentialed checks : yes`. If this plugin logs a negative result, or if the port scanning mechanism fails to show an internal transition to tools like `netstat`, the scan cannot be verified as authenticated, regardless of whether a generic SSH login event was recorded in the system auth logs.

### 3. Ubuntu Package Management & False Positives
Ubuntu maintains long-term support branches by applying security patches directly into existing software packages via a technique known as **backporting**. When a security fix is backported, the main upstream software version number remains identical, while a minor vendor sub-suffix is modified inside the package manager (`dpkg`). Because automated vulnerability scanners frequently perform basic string version matches against remote network banners, they will flag the host as exposed even if the local Ubuntu patch registry confirms the software is fully immune.

### 4. Flaws of Pure CVSS Prioritization
Prioritizing remediation schedules solely by the technical **Common Vulnerability Scoring System (CVSS) Base Score** fails to calculate the actual localized operational risk to the enterprise. CVSS evaluates technical severity in a vacuum, ignoring critical threat context such as whether the bug is actively weaponized by threat actors, whether the target interface is network-reachable, and the business value of the target asset. Adopting pure CVSS metrics leads to inefficient engineering resource allocation, causing teams to scramble over low-risk, unexploitable findings while leaving critical operational exposures unaddressed.

### 5. Leveraging KEV and EPSS Intelligence
Incorporating the **CISA Known Exploited Vulnerabilities (KEV) Catalog** and the **Exploit Prediction Scoring System (EPSS)** provides a dynamic threat-informed perspective on vulnerability tracking. CISA KEV acts as a binary indicator confirming that a vulnerability is actively weaponized by threat actors in the wild, demanding urgent response. Concurrently, EPSS utilizes machine-learning probability calculations to score the real-time likelihood of exploitation velocity over a rolling 30-day window. Together, they allowed the Velora security team to focus engineering effort on active vector categories rather than static theoretical severity metrics.

### 6. Operational Risk & Rollback Protections
The modification carrying the highest operational risk was the activation and configuration of the host packet filter engine via **UFW (`/etc/ufw/before.rules`)**. A single syntax error or misconfigured firewall rule could instantly sever the host's administrative OpenSSH communication paths, causing a permanent remote lockout. To manage this operational risk, a full virtual machine hypervisor hardware snapshot was captured in UTM prior to executing the change, guaranteeing that local console access could roll back system network configurations instantly if connectivity was lost.

### 7. The Fallacy of Patch Installation Closure
A successful package installation or system configuration command execution is completely insufficient to close an open vulnerability ticket. Automated systems frequently fail to apply configurations due to cached memory states, missing daemon reloads, or nested system overrides. Formal risk closure demands strict, independent **evidence-based retesting**—either by verifying that the scanner signature (Plugin ID) is absent in a fresh scan or by validating through native local state checks that the vulnerable runtime code behavior has been completely changed.

### 8. Handling Persistent Posture Metrics
Following the final post-remediation execution (Scan C), all previously identified low-severity configuration defects were successfully eliminated, leaving **zero actionable findings open**. The remaining 48 entries consist entirely of informational discovery logs mapping baseline network statistics. These remain active on our inventory trackers because they represent expected system states (such as validating that an OpenSSH banner is presented on Port 22) rather than security exposures or configuration risks.

### 9. Authoritative Risk Acceptance Evidence
Before formally approving a time-limited **Risk Acceptance Exception** for an asset in an enterprise production environment, a corporate risk owner must review three pieces of authoritative evidence. First, a manual validation log proving the exact exposure depth. Second, a verified threat intelligence report mapping the vulnerability's current weaponization velocity (KEV/EPSS state). Third, technical documentation demonstrating that active compensating controls (such as strict network micro-segmentation or behavioral monitoring) are actively mitigating the risk.

### 10. Automated Life-Cycle Optimization
In the next monthly vulnerability assessment lifecycle execution, the manual data extraction, CSV transcription, and package validation checks should be fully automated. Building custom **Python integration scripts utilizing the Nessus API** would allow the engineering team to programmatically ingest raw scan data. These scripts could automatically compare local package status using `dpkg-query` and fetch threat scores via the EPSS API, entirely replacing manual terminal inputs with a continuous, programmatic remediation pipeline.

