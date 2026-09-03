# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Feature specification from `specs/[###-feature-name]/spec.md`

> Cloud-engineering override of the Spec Kit plan template. This is where **how** belongs.

## Summary

[Primary requirement from the spec, plus the chosen technical approach in two or three sentences.]

## Context Loaded

| File | Section | Why |
|------|---------|-----|
| `memory/constitution.md` | Core Principles | Gate below |
| `context/naming-standards.md` | Patterns, Constraints | Resource naming |
| `context/project-infra-map.md` | Paths | Where to edit |

## Technical Context

**IaC tool**: [Bicep / Terraform / both — from `context/cloud-profile.md`]
**Deployment tool**: [azd / CLI / pipeline]
**Target scope**: [subscription / resource group / cluster]
**Regions**: [primary, failover]
**Resource types**: [list]
**State/secrets**: [Key Vault, tfstate location, or N/A]
**Testing**: [what-if, plan preview, policy scan, smoke test]
**Rollback**: [how this is reverted]

Anything unknown stays `NEEDS CLARIFICATION` — do not guess.

## Constitution Check

*GATE: must pass before Phase 0. Re-check after Phase 1 design.*

| Principle | Status | Notes |
|-----------|--------|-------|
| I. Canonical Naming | PASS / FAIL | Every new name traced to `abbreviations.json` or documented exception |
| II. Infrastructure as Code Only | PASS / FAIL | No manual steps in the rollout |
| III. Human Review Between Phases | PASS / FAIL | Checkpoints identified |
| IV. One Canonical Source | PASS / FAIL | No rule duplicated from `context/` |
| V. Reversible and Observable | PASS / FAIL | Rollback path stated above |

**Exceptions**: [None, or principle + justification + expiry.]

## Resource Naming

Names introduced or changed by this feature. Validate each against `context/naming-standards.md`.

| Resource | Abbreviation key | Pattern | Example | Override param | Constraint check |
|----------|------------------|---------|---------|----------------|------------------|
| | | | | | |

## Project Structure

### Documentation (this feature)

```text
specs/[###-feature]/
├── plan.md              # this file
├── research.md          # Phase 0 — decisions and rejected alternatives
├── data-model.md        # Phase 1 — resource topology and dependencies
├── quickstart.md        # Phase 1 — how a teammate deploys this
├── contracts/           # Phase 1 — parameter and output contracts
└── tasks.md             # Phase 2 — created by /speckit.tasks
```

### Files to change (linked project)

Paths resolve against `{{PROJECT_PATH}}` from `context/project-infra-map.md`.

```text
[e.g. infra/bicep/main.bicep, infra/bicep/app/<new-module>.bicep, infra/bicep/main.parameters.json]
```

## Phase 0 — Research

Unknowns from Technical Context, each resolved with a decision, rationale, and the alternatives rejected. Output to `research.md`.

## Phase 1 — Design

Resource topology and dependency order to `data-model.md`. Parameter and output contracts to `contracts/`. Deployment walkthrough to `quickstart.md`.

## Complexity Tracking

Justify anything that adds a resource, module, or tool beyond the simplest solution that satisfies the spec.

| Addition | Why needed | Simpler option rejected because |
|----------|-----------|--------------------------------|
| | | |
