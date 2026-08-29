# Tool Installation and Verification

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

