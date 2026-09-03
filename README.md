# ICM Cloud Engineer

A cloud-engineering workspace that runs [GitHub Spec Kit](https://github.com/github/spec-kit) inside an [ICM](https://github.com/RinDig/Interpreted-Context-Methdology) context structure.

## Why both

They solve different halves and do not overlap.

| | ICM | Spec Kit |
|---|---|---|
| Axis | Horizontal — context routing | Vertical — work progression |
| Answers | What should the agent load right now? | How does intent become a shipped change? |
| Mechanism | Layered markdown, routing tables | Slash commands, phase artifacts |
| Weakness alone | No opinion on how work progresses | Assumes one pipeline; no answer for recurring ops or reference sprawl |

Spec Kit tells the agent *what phase it is in*. ICM tells it *what to read while it is there*. Used together, `/speckit.plan` stops guessing which naming doc matters and gets a table saying exactly which file and section to load.

## Two lanes

**Lane A — Spec-Driven Development.** Infrastructure work with design decisions.

```
/speckit.specify → /speckit.clarify → /speckit.plan → /speckit.checklist
  → /speckit.tasks → /speckit.analyze → /speckit.implement → /speckit.converge
```

Artifacts land in `specs/<NNN-slug>/`. The Constitution Check gate in `plan.md` enforces `icm/memory/constitution.md`.

**Lane B — Operational stages.** Recurring procedures with a fixed method and no design decisions. Stage contracts in `icm/ops/`. No spec, no branch, no pipeline.

A Lane B stage that starts needing a decision gets promoted to Lane A. That rule is what keeps the two from blurring.

## Layout

```
AGENTS.md / CLAUDE.md     Layer 0 — identity and lane selection
CONTEXT.md                Layer 1 — lane router with per-step context tables

icm/                      ← ICM owns
├── context/              Layer 3 — cloud profile, naming standards, abbreviations
├── memory/               constitution, synced into Spec Kit
├── speckit/overrides/    cloud-flavored spec / plan / tasks templates
├── ops/                  Layer 2 — Lane B stage contracts
├── skills/               Layer 3 — loaded on demand only
└── setup/                onboarding questionnaire

specs/                    ← Spec Kit owns — Layer 4 feature artifacts
.specify/                 ← Spec Kit owns — generated, gitignored

scripts/                  bootstrap-speckit.sh
docs/                     human-facing; never loaded by the agent
```

Each system owns a clearly labelled folder, so it is always obvious who is responsible for a file and what is safe to edit.

`icm/memory/` and `icm/speckit/overrides/` are the authored sources. The bootstrap script copies them into `.specify/`, which is gitignored because Spec Kit owns it. Edit the sources and re-run the script — never edit the copies.

## Setup

```bash
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git@vX.Y.Z
```

Then, with your agent in this directory:

1. Say **`setup`** — answers fill the `{{PLACEHOLDER}}` values in `icm/context/`
2. Run `scripts/bootstrap-speckit.sh cursor` (or `copilot`, `claude`, …)
3. Lane A: `/speckit.specify Add private endpoints to the data tier`
   Lane B: "generate naming conventions for dev"

## Handing this to another AI

**One file does it: `docs/HANDOFF.md`.** It is self-contained — the structure, both lanes, and the non-negotiable rules, assuming no prior context. Copy the whole thing wherever the agent takes instructions.

| Agent | What to do |
|-------|-----------|
| Cursor | Nothing. `.cursor/rules/cloud-engineer.mdc` applies automatically |
| Claude Code | Nothing. `CLAUDE.md` loads automatically |
| Codex, Zed, others honoring the convention | Nothing. `AGENTS.md` loads automatically |
| GitHub Copilot | Paste `docs/HANDOFF.md` into `.github/copilot-instructions.md`, or into chat |
| Gemini CLI | Paste `docs/HANDOFF.md` into `GEMINI.md`, or into chat |
| ChatGPT, Claude web, anything without repo access | Paste `docs/HANDOFF.md` into the conversation |

Deliberately no per-agent pointer files here. One canonical brief you copy where you need it beats five stubs that drift.

Note that no entry point loads the whole workspace, and that is the point. The agent gets the map, then fetches what the active step needs. Loading everything would defeat the layering.

## Giving this its own repository

This branch is the canonical copy and contains nothing but the workspace. See `docs/PUBLISH.md` for the clone-and-push commands.

## Origin

Structure follows Jake Van Clief's folder-as-architecture approach ([video](https://youtu.be/MkN-ss2Nl10), [paper](https://arxiv.org/abs/2603.16021)).

## License

MIT
