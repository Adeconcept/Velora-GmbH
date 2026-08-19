# EV-004: Simulated Multi-Factor Authentication Coverage Summary

## Evidence Tracking Metadata
*   **Evidence ID:** EV-004
*   **Requested From:** IT Manager
*   **Request Date:** 2026-08-17
*   **Date Received:** 2026-08-19
*   **Evidence Label:** Simulated
*   **Controls Supported:** CTL-04, R-001

## Evaluated Population Parameters
*   **Total Active Workforce Identities:** 60 accounts
*   **Total Privileged Administrator Identities:** 4 accounts (included within the workforce population total)

## Technical Configuration Findings
*   **Privileged Account Enforcement:** Multi-Factor Authentication (MFA) is strictly active and enforced via system access policies for all 4 administrative identities.
*   **Standard Workforce Account Enforcement:** Centrally managed MFA rules are entirely absent for the remaining 56 general workforce identities. Individual users can choose to bypass or disable second-factor enrollment.
*   **Legacy Authentication Protocols:** The system configuration dump did not provide positive verification that legacy, basic-authentication endpoints are blocked, leaving a potential vector for automated credential spray bypasses.

## Core Operational Metrics
*   **Calculated MFA Coverage Rate:** $\frac{4}{60} \times 100 = 6.7\%$
*   **Identified Compliance Coverage Gap:** 93.3 percentage-points below the mandated 100% corporate security perimeter target.

## Evidence Limitation Statement
This document contains synthetic test data generated exclusively for the Velora Commerce GmbH compliance scenario mapping. No active production Microsoft Entra ID production tenants were inspected or altered during this evaluation window.

