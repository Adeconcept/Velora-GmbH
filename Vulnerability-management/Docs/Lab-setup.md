# Lab Setup

## Scanner Host
* **Device:** MacBook Pro M1 (2020)
* **Operating System:** macOS Sequoia 15.6 (Observed)
* **NESSUS console version:** Nessus Essentials v10.7.4 (#14) (Observed)
* **Nessus plugin feed date:** 2026-08-25 (Observed)

## Target
* **Asset ID:** LAB-UBU-01
* **Velora reference:** AST-004 (Simulated Criticality)
* **Platform:** Ubuntu Server ARM64 in UTM Virtualization Layer
* **Ubuntu release:** Ubuntu 24.04 LTS (Noble Numbat) (Observed)
* **Kernel baseline:** 6.8.0-40-generic aarch64 (Observed)
* **Published address:** REDACTED_PRIVATE_IP (Observed Target Boundary)

## Network
* **UTM Network mode:** Shared Network (NAT Mode with local DHCP routing) (Observed)
* **Reachability source:** Local host loopback path (Mac scanner host only)
* **Authorized target count:** 1

## Recovery
* **Snapshot state identifier:** `Before-vulnerability-scan`
* **UTM console tested:** Yes (Confirmed working keyboard and frame-buffer capture controls)
* **Snapshot created date:** 2026-08-25 12:00:00 CEST (Observed)

## Evidence Mapping References
* **Precheck diagnostics:** [ubuntu-precheck.txt](../evidence/verification/ubuntu-precheck.txt)
* **Scope definition document:** [scope-and-rules-of-engagement.md](scope-and-rules-of-engagement.md)
* **Asset record entry:** [asset-scope.csv](../registers/asset-scope.csv)

## Evidence Labels
Observed technical values are marked **Observed**. Velora business criticality, asset assignment mapping, and corporate operational guidelines are marked **Simulated**.

