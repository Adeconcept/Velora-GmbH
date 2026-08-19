# Lessons Learned

### Why did a backup-job record not prove recoverability?
A backup-job record only proves that a write operation successfully completed and generated an archive file at a specific time. It does not verify that the data inside the file is uncorrupted, structurally compatible, or capable of being re-injected into a production environment under emergency constraints. True recoverability can only be verified by executing a live restoration drill and validating the output metrics against recovery time objectives.

---

### Why was CTL-15 marked Not Tested instead of Fail?
Under our strict evidence-handling procedure, a control can only be marked as a failure if we analyze a verified artifact that demonstrates it missed its operational criteria or was entirely absent. Because the evidence request for security awareness (**EV-014**) was completely unavailable, we had zero data points to support either a positive or negative conclusion. Marking it as **Not Tested** preserves professional audit objectivity by refusing to guess when evidence is missing.

---

### What is the difference between design and operating effectiveness?
Design effectiveness evaluates whether a control is planned well enough on paper to successfully prevent or mitigate a specific security risk. Operating effectiveness checks whether that planned control actually ran consistently, across the entire scope, and followed its documented schedule during the review window. A control can be beautifully designed but fail in practice due to poor execution, missing ownership, or lack of coverage.

---

### Which finding was hardest to write without overstating the evidence?
The finding for secret management (**F-012**) was the hardest to write without overstating things because private repositories and code peer reviews can feel like functional protections to engineering teams. It required objective documentation to show that while these standard development habits are good, they do not prove that automated, active code pipeline scanning or credential vaulting controls are running. We had to separate standard engineering peer habits from verified, programmatic enforcement tools.

---

### Why is a vendor's inherent review priority not a security rating?
The inherent review priority is a calculation of Velora's operational dependency and potential data exposure size if that third-party provider fails. It does not measure whether the vendor's actual security posture is strong, weak, secure, or insecure on their end. A highly secure vendor can still receive a **Critical** review priority simply because they host core data or hold high-privilege administrative access to our infrastructure.

---

### What privacy decisions could a cybersecurity analyst identify but not make alone?
A cybersecurity analyst can identify missing data protection impacts, map out information flows, flag missing data processing terms, and catch profiling risks like user-level tracking. However, they cannot officially assign legal processing bases, approve corporate data retention windows, or grant regulatory exemptions under GDPR. Those decisions require the formal authorization of the business data owners and qualified legal or privacy counsel.

---

### What evidence would you request before closing F-003, F-009, and F-011?
To close **F-003** (MFA), I would request a live conditional access policy report from Entra ID showing 100% active workforce compliance and the blocking of legacy authentication protocols. For **F-009** (Backups), I would require a signed technical restoration drill log showing complete data structure validation and an elapsed recovery time beneath the 4-hour target. For **F-011** (Vendors), I would mandate the inspection of a prioritized third-party risk index containing executed DPAs and formal security risk sign-offs for all seven core providers.

---

### How did Week 17 risk severity change Week 18 remediation timing?
Our remediation calendar was driven entirely by our initial risk severity scores rather than the perceived ease of fixing a system. Dangers calculated as **Critical** in our risk ledger—specifically server vulnerabilities and unverified backups—automatically triggered a strict mandate requiring temporary fixes and mitigation planning within a 14-day window. Dangers scoring in the High or Medium categories were safely sequenced later in the 90-day plan to ensure our engineering bandwidth focused on the largest liabilities first.

