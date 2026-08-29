# AWS Posture Review Methodology

This document outlines the systematic configuration audit workflow, evaluation states, and technical tooling definitions used to execute the Velora AWS Cloud Posture Assessment.

## 1. Review Sequence
1. **Define scope and authorization:** Establish strict operational and region boundaries (`docs/scope-and-authorization.md`).
2. **Protect the account and control cost:** Validate root boundaries and establish budget alarms to prevent cloud drift liabilities.
3. **Inventory resources and evidence sources:** Catalog running infrastructure components to map out the system attack surface.
4. **Collect read-only configuration evidence:** Run automated collector hooks (`scripts/collect-read-only-evidence.sh`) to extract architecture states.
5. **Evaluate each control:** Map findings to one of five deterministic standard tracking states (Passed, Failed, Manual Review, Not Applicable, or Not Reviewed).
6. **Create a finding:** Log an entry in the register *only* when hard configuration evidence exposes a structural security control gap.
7. **Connect the gap:** Ensure total structural lineage by linking each finding directly to an asset ID, threat scenario, business impact profile, and technical owner.
8. **Retest approved changes:** Re-run targeted read-only configurations after applying structural fixes to verify remediation.
9. **Redact all portfolio evidence:** Apply data minimization and string sanitization across all public-facing repository artifacts.

## 2. Control Statuses Definitions

| Status | Meaning |
| :--- | :--- |
| **Passed** | Empirical technical evidence directly confirms that the system configuration meets the specified check at review time. |
| **Failed** | Empirical data or command outputs show that the stated security control is completely missing, misconfigured, or ineffective. |
| **Manual Review** | Automated configuration evidence cannot independently determine operational business intent or design effectiveness. |
| **Not Applicable** | The specific infrastructure resource, policy directive, or regulatory check is not relevant to the account layer, backed by a written reason. |
| **Not Reviewed** | Technical API permission blocks, project timeline windows, cost constraints, or scope parameters prevented active assessment. |

## 3. Evidence Sufficiency
Defensive conclusions must rely strictly on authoritative cloud telemetry data, including console tags, AWS CLI JSON output models, generated credential reports, IAM policy syntax definitions, CloudTrail events, or immutable log configurations. The abstract absence of evidence cannot be treated as structural proof of control compliance.

## 4. Tools and Versions (M1 MacBook Host Platform)
*   **AWS CLI Version:** `aws-cli/2.17.32 Python/3.11.9 Darwin/25.0.0 (ARM64)` [Tested]
*   **jq Utility Version:** `jq-1.7.1` [Tested]
*   **Access Browser:** Chromium Embedded Burp Browser v150.0.0.0 [Observed]
*   **Primary Review Region:** `eu-central-1` (Frankfurt Hub) [Observed]
*   **Review Date:** 2026-08-29 [Observed]


---

## Tool Installation and Verification

## 1. Installation Procedures

### AWS CLI v2 Installation
The installation utilizes the official AWS command-line distribution channel to ensure package integrity and avoid third-party security risks. 

Download and install the native package via the terminal:
   ```bash
   curl -fsSL https://awscli.amazonaws.com/v2/install.sh | bash
   ```

### jq Installation
The lightweight command-line JSON processor `jq` is required for slicing and formatting raw cloud log outputs. Install it using the standard package manager:

```bash
brew install jq
```

---

## 2. Environment Verification Evidence
To confirm successful deployment and ensure path configurations are properly mapped, the binaries were verified within the standard zsh terminal environment.

### Command Execution:
```bash
aws --version
jq --version
```

### Recorded Version Logs:
*   **AWS CLI Version:** `aws-cli/2.36.34 Python/3.14.6 Darwin/25.6.0 script-exe/arm64`
*   **jq Version:** `jq-1.7.1-apple`

