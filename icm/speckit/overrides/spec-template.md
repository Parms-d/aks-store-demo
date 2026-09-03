# Infrastructure Specification: [FEATURE NAME]

**Feature Branch**: `[###-feature-name]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"

> Cloud-engineering override of the Spec Kit spec template. Describe **what** must exist and **why**. No resource names, SKUs, or module layout — those belong in `plan.md`.

## Context Loaded

Record which Layer 3 files informed this spec. Keeps the token budget auditable.

| File | Section |
|------|---------|
| `icm/context/cloud-profile.md` | Environments, workload |

## Operational Scenarios *(mandatory)*

Each scenario is an independently deliverable slice. If only one ships, it must still be useful.

### Scenario 1 - [Brief Title] (Priority: P1)

[What capability the platform gains, in plain language.]

**Why this priority**: [Value and urgency.]

**Independent Test**: [How to verify this alone — e.g. "deploy to dev and confirm the workload resolves the secret without a stored credential".]

**Acceptance Scenarios**:

1. **Given** [starting state], **When** [action], **Then** [observable outcome]
2. **Given** [starting state], **When** [action], **Then** [observable outcome]

---

### Scenario 2 - [Brief Title] (Priority: P2)

[Repeat the structure above. Delete unused scenarios.]

## Requirements *(mandatory)*

- **FR-001**: The platform MUST [capability]
- **FR-002**: The platform MUST [capability]
- **NFR-001**: [Availability, RPO/RTO, latency, or cost ceiling]

Mark anything uncertain as `[NEEDS CLARIFICATION: question]` and resolve it with `/speckit.clarify` before planning.

## Environments in Scope

| Environment | In scope | Notes |
|-------------|----------|-------|
| {{ENV_DEV}} | | |
| {{ENV_STAGING}} | | |
| {{ENV_PROD}} | | |

## Compliance and Guardrails

Constraints this feature inherits. Do not restate the rules — link to them.

| Concern | Source |
|---------|--------|
| Naming | `icm/context/naming-standards.md` |
| Principles | `icm/memory/constitution.md` |
| Tagging | `icm/context/naming-standards.md` — Required Tags |

## Out of Scope

- [Explicitly excluded item, so `/speckit.plan` does not invent it]

## Success Criteria

Measurable and technology-agnostic.

- **SC-001**: [e.g. "every deployed resource carries the required tags, verified by policy scan"]
- **SC-002**: [e.g. "environment can be torn down and recreated from templates with no manual steps"]
