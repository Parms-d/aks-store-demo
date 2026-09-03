# Cloud Engineering Constitution

Governing principles for all infrastructure work in this workspace. `/speckit.plan` enforces these at the Constitution Check gate. A plan that cannot satisfy a principle must record an explicit, justified exception.

## Core Principles

### I. Canonical Naming (NON-NEGOTIABLE)

Every Azure resource name traces to a documented source. Abbreviations resolve from the linked project's IaC first, then `icm/context/abbreviations.json`, then Microsoft CAF. Inventing an abbreviation is a defect. Names that violate the length, charset, or uniqueness constraints in `icm/context/naming-standards.md` do not ship.

### II. Infrastructure as Code Only

No resource is created by portal click or ad-hoc CLI. If it is not in the linked project's IaC, it does not exist. Changes to live infrastructure begin as changes to templates.

### III. Human Review Between Phases

Each phase produces a plain-text artifact a human can read and edit before the next phase consumes it. The agent does not chain `specify` through `implement` without stopping. Checkpoints exist to be used, and an edited artifact is authoritative over what the agent originally wrote.

### IV. One Canonical Source

Every fact has exactly one home. Reference material lives in `icm/context/`; specs and plans link to it. The moment a naming rule exists in two files they begin to drift, and the drift is discovered during an incident rather than a review.

### V. Reversible and Observable

Changes are diffable, reversible, and inspectable without special tooling. Prefer parameterized overrides to forked templates. Every artifact is a file in git; pipeline state is the filesystem.

## Additional Constraints

- **Tagging** — every resource carries the required tags in `icm/context/naming-standards.md`.
- **Secrets** — never written to `specs/`, `icm/ops/*/output/`, or `icm/context/`. Reference the secret store by name only.
- **Environment parity** — a change applied to production must exist in a lower environment first, unless the plan records why not.
- **Tool divergence** — when Bicep and Terraform coexist, document naming for each; never imply one covers both.

## Development Workflow

- **Lane A (SDD)** — design work runs `specify → clarify → plan → checklist → tasks → analyze → implement → converge`. The Constitution Check gate runs at `plan` and re-runs after design changes.
- **Lane B (Ops)** — recurring procedures run their ICM stage contract with its Audit section as the quality gate.
- **Promotion** — a Lane B stage that needs a design decision stops and becomes a Lane A feature.
- **Convergence** — Lane A is not done until `/speckit.converge` reports converged.

## Governance

This constitution supersedes convenience. Amendments require a version bump, a dated entry below, and a note of what changed and why. Plans that violate a principle must either be revised or record the exception in the Constitution Check section with a named justification — silent violations are defects.

**Version**: 1.0.0 | **Ratified**: 2026-09-03 | **Last Amended**: 2026-09-03
