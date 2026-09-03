---
description: "Infrastructure task list template"
---

# Tasks: [FEATURE NAME]

**Input**: Design documents from `specs/[###-feature-name]/`
**Prerequisites**: `plan.md` (required), `spec.md` (required for scenarios), `research.md`, `data-model.md`, `contracts/`

> Cloud-engineering override of the Spec Kit tasks template. Tasks are grouped by operational scenario so each can be deployed and verified independently.

## Format: `[ID] [P?] [Scenario] Description`

- **[P]** — parallelizable (different files, no dependency)
- **[Scenario]** — which spec scenario this serves (S1, S2, …)
- Every task names exact file paths, resolved against `{{PROJECT_PATH}}`

## Phase 1: Setup

**Purpose**: Prepare the working branch and confirm baseline state.

- [ ] T001 Confirm linked project path and IaC tool from `context/cloud-profile.md`
- [ ] T002 Capture current deployed state (`az deployment sub what-if` or `terraform plan`) as the baseline
- [ ] T003 [P] Verify required tags and naming rules in `context/naming-standards.md` are current

---

## Phase 2: Foundational (blocking)

**Purpose**: Shared infrastructure every scenario depends on. Must complete before any scenario phase.

- [ ] T004 [Module, parameter, or identity that other resources bind to]

---

## Phase 3: Scenario 1 — [Title] (Priority: P1)

**Goal**: [What this delivers.]
**Independent verification**: [How to confirm it alone.]

- [ ] T005 [P] [S1] Add [resource] to `[path]` using the name pattern from `plan.md`
- [ ] T006 [S1] Wire [parameter/output] in `[path]`
- [ ] T007 [S1] Run deployment preview and confirm no unintended replacements
- [ ] T008 [S1] Deploy to {{ENV_DEV}} and verify acceptance scenarios from `spec.md`

**Checkpoint**: Scenario 1 is independently deployable. Stop for human review.

---

## Phase 4: Scenario 2 — [Title] (Priority: P2)

- [ ] T009 [P] [S2] [Task]

**Checkpoint**: Stop for human review.

---

## Phase 5: Hardening

- [ ] T010 [P] Confirm every new resource carries required tags
- [ ] T011 [P] Validate all names against `context/naming-standards.md` constraint table
- [ ] T012 Document rollback steps in `quickstart.md`
- [ ] T013 Promote through {{ENV_STAGING}} to {{ENV_PROD}} per environment parity rule

## Dependencies

- Phase 2 blocks all scenario phases
- Scenario phases are independent of each other unless noted
- Hardening runs last

## Audit (run before marking complete)

| Check | Pass condition |
|-------|----------------|
| Naming | Every name traces to `abbreviations.json` or a documented exception |
| Constraints | Length, charset, and uniqueness verified per resource type |
| Tags | Required tags present on every new resource |
| Reversibility | Rollback path documented and plausible |
| Constitution | No principle violated without a recorded exception |
