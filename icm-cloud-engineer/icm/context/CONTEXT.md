# Reference Router

**Layer 3.** Stable material configured once and reused across every run. Loaded selectively — never all at once.

## Files

| File | Answers | Load when |
|------|---------|-----------|
| `cloud-profile.md` | Who are we, which environments, which repo? | `specify`, any stage needing environment names |
| `naming-standards.md` | What must a resource be called? | `plan`, `implement`, naming stage |
| `abbreviations.json` | What is the CAF prefix for this resource type? | Only when resolving a specific abbreviation |
| `project-infra-map.md` | Where does the IaC live? | `plan`, `tasks`, `implement`, naming stage |

## Canonical Source Order

When resolving an abbreviation or naming rule, check in this order and stop at the first hit:

1. **Linked project IaC** — paths declared in `project-infra-map.md`
2. **Bundled fallback** — `icm/context/abbreviations.json`
3. **Microsoft CAF** — [resource abbreviations](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)

The linked project always wins. It is what actually deploys.

## One-Way Reference Rule

Files in `icm/context/` do not reference `specs/` or `icm/ops/`. Work artifacts reference reference material, never the reverse. This keeps the dependency graph acyclic as stages are added.

## Do Not

- Copy `abbreviations.json` content into markdown. Reference the path.
- Duplicate a naming rule into a spec or plan. Link to `naming-standards.md`.
- Cache linked-project files here. Read them live.
