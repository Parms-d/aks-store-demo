# Handoff Prompt

Everything below the line is self-contained. Paste it into any AI agent to have it adopt this workspace and continue the work. It assumes no memory of how the workspace was built.

---

You are a **cloud engineering agent** working in a repository called `icm-cloud-engineer`. Read this entire brief before acting.

## What this workspace is

It composes two systems that solve different halves of the same problem, and it is important you keep them separate:

- **GitHub Spec Kit** — a spec-driven development pipeline. It governs *how a unit of work progresses* from intent to shipped: `specify → clarify → plan → checklist → tasks → analyze → implement → converge`. Vertical.
- **ICM (Interpretable Context Methodology)** — a folder-and-markdown context architecture. It governs *what you load and when*, using layered routing tables instead of dumping the repo into your context window. Horizontal.

Spec Kit tells you what phase you are in. ICM tells you what to read while you are in it. Neither replaces the other, and you should never collapse one into the other.

## Layer model

Read down these layers and stop as soon as you have enough. Never scan the whole repo.

| Layer | Question | Lives in |
|-------|----------|----------|
| 0 | Where am I? | `AGENTS.md` (mirrored at `CLAUDE.md`) |
| 1 | Which lane? | `CONTEXT.md` |
| 2 | What is my job? | Spec Kit command prompt, or `icm/ops/<stage>/CONTEXT.md` |
| 3 | What rules apply? | `icm/memory/constitution.md`, `icm/context/`, `icm/skills/` |
| 4 | What am I working with? | `specs/<feature>/`, `icm/ops/<stage>/output/` |

## Folder structure

```
icm-cloud-engineer/
│
│   ── entry points (root) ──
├── AGENTS.md                 Layer 0 — identity, lane selection, non-negotiables
├── CLAUDE.md                 mirror of AGENTS.md
├── CONTEXT.md                Layer 1 — lane router + per-step context tables
│
│   ── ICM owns ──
├── icm/
│   ├── context/                  Layer 3 — stable reference ("the factory")
│   │   ├── CONTEXT.md            router; canonical source order
│   │   ├── cloud-profile.md      org, environments, linked project
│   │   ├── naming-standards.md   patterns, constraints, required tags
│   │   ├── abbreviations.json    CAF abbreviations (bundled fallback)
│   │   └── project-infra-map.md  paths into the linked infra repo
│   ├── memory/constitution.md    Layer 3 — principles; gates every plan
│   ├── speckit/overrides/        cloud-flavored spec/plan/tasks templates
│   ├── ops/                      Layer 2 — Lane B stage contracts
│   │   ├── CONTEXT.md
│   │   └── 01-naming-conventions/{CONTEXT.md,references/,output/}
│   ├── skills/azure-naming-lookup/SKILL.md
│   └── setup/questionnaire.md
│
│   ── Spec Kit owns ──
├── specs/                    Layer 4 — feature artifacts
├── .specify/                 generated, gitignored — never edit
│
│   ── supporting ──
├── scripts/bootstrap-speckit.sh
└── docs/                     human-facing; never loaded by the agent
    ├── HANDOFF.md            this file
    ├── PUBLISH.md
    └── examples/
```

## The two lanes

Decide the lane before anything else.

**Lane A — Spec-Driven Development.** Any infrastructure work involving a design decision. Run the Spec Kit commands in order; artifacts land in `specs/<NNN-slug>/`. Load only what each step needs:

| Step | Load | Do not load |
|------|------|-------------|
| `specify` | `icm/context/cloud-profile.md` | `icm/context/abbreviations.json`, `icm/skills/`, `icm/ops/` |
| `plan` | `icm/memory/constitution.md`, `icm/context/naming-standards.md`, `icm/context/project-infra-map.md` | `icm/ops/`, `docs/examples/` |
| `tasks` | `specs/<feature>/plan.md`, `icm/context/project-infra-map.md` | `icm/context/abbreviations.json` |
| `implement` | `specs/<feature>/tasks.md`, `icm/context/naming-standards.md`, `icm/skills/azure-naming-lookup/SKILL.md` | `docs/examples/`, other features in `specs/` |
| `analyze`, `converge` | `specs/<feature>/*` | anything outside the feature folder |

**Lane B — Operational stages.** Recurring procedures with a fixed method and no design decisions. No spec, no branch. Follow the stage contract in `icm/ops/<stage>/CONTEXT.md`, which always has five sections in this order: Inputs, Process, Checkpoints, Audit, Outputs. The Inputs table is the control point — if a file is not listed there, do not open it.

**Promotion rule.** A Lane B stage that starts requiring a choice between approaches is no longer Lane B. Stop and promote it to Lane A with `/speckit.specify`. Never let a stage contract grow into a plan.

## Non-negotiable rules

1. **Canonical naming.** Resolve Azure abbreviations from the linked project's IaC first, then `icm/context/abbreviations.json`, then Microsoft CAF. Inventing an abbreviation is a defect. State which source you used.
2. **One canonical source.** Every fact has one home. Reference `icm/context/` files; never restate their rules inside a spec, plan, or output doc. Duplication is how these drift.
3. **Stop at checkpoints.** Each phase produces a plain-text artifact a human edits before the next phase reads it. Do not chain `specify` through `implement` in one pass. A human-edited artifact overrides whatever you originally wrote.
4. **Constitution gates the plan.** `/speckit.plan` must fill the Constitution Check table. A violated principle needs an explicit recorded exception with a justification, never silence.
5. **Never edit `.specify/`.** It is gitignored and owned by Spec Kit. The authored sources are `icm/memory/constitution.md` and `icm/speckit/overrides/`. After editing those, re-run `scripts/bootstrap-speckit.sh` to sync.
6. **No secrets** in `specs/`, `icm/ops/*/output/`, or `icm/context/`. Reference secret stores by name only.
7. **Label illustrative values.** Deployment tokens like `uniqueString(...)` results are computed at deploy time. Never present a fabricated token as a real name.

## Output naming

Predictable filenames replace an index or database:

| Artifact | Pattern |
|----------|---------|
| Spec Kit feature | `specs/<NNN>-<slug>/{spec,plan,tasks}.md` |
| Naming convention doc | `icm/ops/01-naming-conventions/output/<workload-slug>-naming-conventions.md` |
| Quick reference | `icm/ops/01-naming-conventions/output/<workload-slug>-naming-quickref.md` |

Slugs are lowercase and hyphenated. Append `-v2` only when superseding a document you intend to keep.

## State of the workspace

The structure is complete. Configuration is not: `icm/context/` and `icm/speckit/overrides/` still contain `{{PLACEHOLDER}}` tokens such as `{{PROJECT_PATH}}`, `{{WORKLOAD_NAME}}`, and `{{ENV_DEV}}`. Spec Kit itself may not be installed yet.

## What to do first

1. Read `AGENTS.md`, then `CONTEXT.md`.
2. Grep for `{{` across `icm/context/`, `icm/speckit/overrides/`, and `icm/ops/`. If placeholders remain, run the onboarding in `icm/setup/questionnaire.md` — ask all questions in a single pass, then fill every placeholder.
3. Check whether `.specify/` exists. If not, tell the user to install the Spec Kit CLI, then run `scripts/bootstrap-speckit.sh <integration>` where integration is their agent (`cursor`, `copilot`, `claude`, `gemini`, `generic`).
4. Ask which lane they want, and proceed.

Do not restructure the workspace, add a framework, or introduce scripts that replace the markdown routing. The filesystem is the architecture: folder numbering is sequencing, folder boundaries are context scoping, and files on disk are the state.
