# Threat-Modeling Methodology

This document establishes the repeatable, structured threat-modeling framework used by Velora Commerce GmbH to evaluate systemic architectural risks, identify application design defects before software implementation, and maintain strong compliance controls across the secure software development lifecycle (S-SDLC).

## 1. Core Analytical Questions
The threat-modeling lifecycle systematically evaluates infrastructure designs by answering eight technical and operational questions:
1. **What are we building?** Establish clear technical boundaries via Data-Flow Diagrams (DFDs).
2. **What valuable assets and data does it handle?** Identify and catalog information payloads (e.g., DAT-001, DAT-002) intersecting the environment.
3. **Where does identity, privilege, ownership, or control change?** Locate and isolate critical trust boundaries (e.g., TB1, TB2).
4. **What can go wrong?** Enumerate plausible structural abuse scenarios using industry-standard threat frameworks.
5. **Which scenarios matter most?** Prioritize threat items via qualitative and quantitative inherent risk metrics.
6. **What control should prevent, detect, or limit each scenario?** Propose specific architectural and programming countermeasures.
7. **How will the control be verified?** Map every defensive requirement to explicit automated and manual security verification tests.
8. **Who accepts what remains?** Ensure transparent technical sign-off and formal executive risk owner accountability.

## 2. Operational Framework Rules
*   **Systemic Modeling:** Deconstruct the target architecture into a formalized, portable Mermaid-based Data-Flow Diagram (DFD) tracking Processes, Data Stores, External Entities, and Data Flows.
*   **STRIDE Execution:** Apply the STRIDE matrix systematically to every modeled component and across all boundary-crossing network transactions.
*   **Abuse Case Alignment:** Craft descriptive, misuse-oriented abuse scenarios mapping real-world attacker methodologies directly against core business workflows.
*   **Quantitative Scoring:** Compute inherent and residual Risk Scores using the established 5x5 Likelihood and Impact prioritization matrix.
*   **Risk Governance Track:** Assign explicit risk decisions: **Avoid** (re-engineer out of scope), **Mitigate** (deploy defensive technical controls), **Transfer** (delegate liability to an approved third party), or **Accept** (log as managed residual risk).
*   **Traceability Assurance:** Every mitigation decision must map directly to a testable security requirement and link to an independent verification test script.
*   **Continuous Review:** Re-evaluate and re-trigger the threat model execution whenever material code alterations, routing infrastructure shifts, or logic changes occur.

## 3. STRIDE Threat Classifications
*   **Spoofing:** Pretending to be another user, system identity, API token, third-party webhook connection, or background build service.
*   **Tampering:** Unauthorized modification or malicious alteration of persistent data stores, runtime memory strings, transit network packets, or software deployment files.
*   **Repudiation:** Denying a malicious or state-changing action because attribution logging evidence is missing, unauthenticated, or un-retained.
*   **Information Disclosure:** Unauthorized reading or structural leakage of Restricted or Confidential data records to unauthorized users or logging outputs.
*   **Denial of Service:** Preventing, disrupting, or degrading intended application services, memory space, network loops, or compute operations.
*   **Elevation of Privilege:** Gaining computational capabilities, path executions, or dashboard access rights beyond intended authorization models.

## 4. Analytical Boundary Note
The STRIDE methodology operates as a structural questioning engine to uncover potential architectural weaknesses. It does not provide absolute proof of an exploitable vulnerability, nor does it automatically dictate localized enterprise business severity without contextual prioritization logic.
