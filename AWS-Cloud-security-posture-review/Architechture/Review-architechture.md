# Architecture Review

```mermaid
flowchart TD
    A["Analyst on MacBook M1"]
    SSO["Temporary or federated AWS session"]

    subgraph LAB["Authorized AWS learning account"]
        IAM["IAM and account controls"]
        S3["S3 configuration"]
        CT["CloudTrail activity and trails"]
        MON["Monitoring posture"]
    end

    RAW["Local private evidence, excluded from Git"]
    PUB["Sanitized portfolio evidence"]

    A -->|"AWS CLI and console"| SSO
    SSO --> IAM
    SSO --> S3
    SSO --> CT
    SSO --> MON
    IAM --> RAW
    S3 --> RAW
    CT --> RAW
    MON --> RAW
    RAW -->|"Manual review and redaction"| PUB
```

The assessment collects configuration evidence through an authorized identity. Raw output remains local. Only redacted summaries and screenshots enter the portfolio repository.
