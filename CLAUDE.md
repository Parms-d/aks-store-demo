# Cloud Engineer

This file mirrors `AGENTS.md` so agents that look for either name find the same Layer 0 entry point.

**Read [`AGENTS.md`](AGENTS.md) now.** It defines the two lanes, the folder map, the layer model, and the non-negotiables.

Short version:

- **Lane A** — infrastructure work with design decisions → GitHub Spec Kit (`/speckit.specify` onward), artifacts in `specs/`
- **Lane B** — recurring procedures with a fixed method → ICM stage contracts in `ops/`
- Load only what the active step's context table names. Never scan the repo.
- Abbreviations resolve from the linked project first, then `context/abbreviations.json`. Never invent one.
- `memory/constitution.md` gates every plan.
