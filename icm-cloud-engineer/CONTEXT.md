# Lane Router

**Layer 1.** Read on entry, after `AGENTS.md`. Routes to a lane, then stops.

## Lane A — Spec-Driven Development (Spec Kit)

For infrastructure work that involves design decisions. Produces artifacts in `specs/<NNN-slug>/`.

| Step | Command | Produces |
|------|---------|----------|
| 0 | `/speckit.constitution` | `icm/memory/constitution.md` (once per project) |
| 1 | `/speckit.specify` | `spec.md` — what and why |
| 2 | `/speckit.clarify` | resolved ambiguities in `spec.md` |
| 3 | `/speckit.plan` | `plan.md`, `research.md`, `data-model.md`, `contracts/` |
| 4 | `/speckit.checklist` | `checklists/*.md` quality gates |
| 5 | `/speckit.tasks` | `tasks.md` — dependency-ordered work |
| 6 | `/speckit.analyze` | consistency report across spec/plan/tasks |
| 7 | `/speckit.implement` | the actual IaC changes |
| 8 | `/speckit.converge` | gap check; appends tasks until converged |

Short path for small changes: 1 → 3 → 5 → 7 → 8.

### Context to load per Spec Kit step

This is the ICM contribution to Lane A. Load only these.

| Step | Load | Do NOT load |
|------|------|-------------|
| `specify` | `icm/context/cloud-profile.md` | `icm/context/abbreviations.json`, `icm/skills/`, `icm/ops/` |
| `plan` | `icm/memory/constitution.md`, `icm/context/naming-standards.md`, `icm/context/project-infra-map.md` | `icm/ops/`, `docs/examples/` |
| `tasks` | `specs/<feature>/plan.md`, `icm/context/project-infra-map.md` | `icm/context/abbreviations.json` |
| `implement` | `specs/<feature>/tasks.md`, `icm/context/naming-standards.md`, `icm/skills/azure-naming-lookup/SKILL.md` | `docs/examples/`, other features in `specs/` |
| `analyze`, `converge` | `specs/<feature>/*` | everything outside the feature folder |

## Lane B — Operational Stages (ICM)

For recurring tasks with a fixed procedure and no design decisions. No spec, no branch.

| Task | Go to |
|------|-------|
| Generate Azure naming conventions | `icm/ops/01-naming-conventions/CONTEXT.md` |

Lane B stages follow the ICM stage contract: Inputs, Process, Checkpoints, Audit, Outputs.

## Promotion Rule

A Lane B stage that starts requiring design decisions is no longer Lane B. Promote it to Lane A with `/speckit.specify`. Do not grow a stage contract into a plan.

## Shared Resources

| Resource | Location | Contains |
|----------|----------|----------|
| Constitution | `icm/memory/constitution.md` | Principles enforced at the plan gate |
| Reference router | `icm/context/CONTEXT.md` | Routes to profile, standards, abbreviations |
| Naming skill | `icm/skills/azure-naming-lookup/SKILL.md` | Abbreviation lookup and name validation |
| Template overrides | `icm/speckit/overrides/` | Cloud-flavored spec/plan/tasks templates |
