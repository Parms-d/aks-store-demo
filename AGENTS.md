# Cloud Engineer — Agent Entry Point

**Layer 0.** Always read this first. It tells you where you are and which lane to take.

This workspace combines two systems that solve different halves of the same problem:

- **[ICM](https://github.com/RinDig/Interpreted-Context-Methdology)** (Interpretable Context Methodology) — decides *what context to load and when*. Horizontal.
- **[GitHub Spec Kit](https://github.com/github/spec-kit)** — decides *how a unit of work progresses from intent to done*. Vertical.

ICM routes. Spec Kit executes. They do not overlap.

## Two Lanes

Pick a lane before doing anything else.

| Lane | Use when | Entry point |
|------|----------|-------------|
| **A — SDD** | Net-new or changed infrastructure, anything needing design and review | `/speckit.specify` (see `CONTEXT.md`) |
| **B — Ops** | Recurring deterministic task with a known procedure and no design decisions | `icm/ops/<stage>/CONTEXT.md` |

If you are unsure, it is Lane A. Lane B is only for tasks that already have a stage folder.

## Folder Map

```
icm-cloud-engineer/
│
│   ── entry points (root, where agents look) ──
├── AGENTS.md                (you are here — Layer 0, canonical)
├── CLAUDE.md                (pointer here — Claude Code)
├── GEMINI.md                (pointer here — Gemini CLI)
├── .github/copilot-instructions.md   (pointer here — Copilot)
├── .cursor/rules/           (pointer here — Cursor, alwaysApply)
├── CONTEXT.md               (Layer 1 — lane router)
│
│   ── ICM owns this ──
├── icm/
│   ├── context/             (Layer 3 — stable reference, "the factory")
│   │   ├── CONTEXT.md
│   │   ├── cloud-profile.md     (org, environments, linked project)
│   │   ├── naming-standards.md  (canonical naming rules)
│   │   ├── abbreviations.json   (CAF abbreviations, bundled fallback)
│   │   └── project-infra-map.md (paths into your infra repo)
│   ├── memory/constitution.md   (source of truth; synced into .specify/)
│   ├── speckit/overrides/       (cloud-flavored spec/plan/tasks templates)
│   ├── ops/                 (Layer 2 — Lane B stages)
│   │   └── 01-naming-conventions/
│   ├── skills/              (Layer 3 — loaded on demand only)
│   └── setup/questionnaire.md
│
│   ── Spec Kit owns this ──
├── specs/                   (Layer 4 — feature artifacts)
├── .specify/                (generated, gitignored — never edit)
│
│   ── supporting ──
├── scripts/bootstrap-speckit.sh
└── docs/                    (human-facing; never loaded by the agent)
    ├── HANDOFF.md
    ├── PUBLISH.md
    └── examples/
```

## Layer Model

| Layer | Question | Lives in |
|-------|----------|----------|
| 0 | Where am I? | `AGENTS.md` / `CLAUDE.md` |
| 1 | Which lane? | `CONTEXT.md` |
| 2 | What is my job? | Spec Kit command prompt, or `icm/ops/*/CONTEXT.md` |
| 3 | What rules apply? | `icm/memory/constitution.md`, `icm/context/`, `icm/skills/` |
| 4 | What am I working with? | `specs/<feature>/`, `icm/ops/*/output/` |

Read down the layers and stop when you have enough. Never load the whole repo.

## Triggers

| Keyword | Action |
|---------|--------|
| `setup` | Run `icm/setup/questionnaire.md`, then `scripts/bootstrap-speckit.sh` |
| `status` | Report Lane A features in `specs/` and Lane B stage output in `icm/ops/*/output/` |

## Non-Negotiables

1. Resolve abbreviations from the linked project first, then `icm/context/abbreviations.json`. Never invent one.
2. Every Lane A plan passes the Constitution Check gate in `icm/memory/constitution.md`.
3. Pause at checkpoints. Stage output is a human edit surface, not a handoff to yourself.
4. One canonical source per fact. If a rule exists in `icm/context/`, reference it — do not restate it.
