# Stage 01: Naming Conventions

Produce the standard Azure resource naming document for a workload, grounded in the linked project's actual IaC.

## Inputs

| Source | File | Section | Why |
|--------|------|---------|-----|
| User | conversation | Environment name, optional region | Scopes the examples |
| Layer 3 | `../../context/cloud-profile.md` | Linked Project, Resource Types in Scope | What to document |
| Layer 3 | `../../context/naming-standards.md` | Full file | Patterns, constraints, tags |
| Layer 3 | `../../context/project-infra-map.md` | Paths, What to Extract | Where to read IaC |
| Layer 3 | `references/output-format.md` | Full file | Required shape of the doc |
| Linked project | `{{ABBREVIATIONS_PATH}}` | Full file | Canonical abbreviations |
| Linked project | `{{BICEP_MAIN_PATH}}` | Token formula, override params | Real name construction |
| Fallback | `../../context/abbreviations.json` | Only keys needed | Used if linked file is missing |
| Skill | `../../skills/azure-naming-lookup/SKILL.md` | Full file | Lookup and validation method |

Do not load `../../specs/`, `../../examples/`, or the constitution. This stage makes no design decisions.

## Process

1. Confirm the environment and region, or take them from `../../context/cloud-profile.md`
2. Resolve the abbreviation source: linked project first, bundled fallback second. State which one you used
3. Read the linked IaC for the token formula, override parameters, and any hardcoded prefixes
4. Enumerate every resource type in scope
5. For each: abbreviation key, pattern, example name, override parameter, constraint check
6. **[Checkpoint]** — present the table and stop for human review
7. Run the Audit below; revise until every check passes
8. Write `output/<workload-slug>-naming-conventions.md`
9. Write `output/<workload-slug>-naming-quickref.md`

## Checkpoints

| After step | Present | Human decides |
|------------|---------|---------------|
| 6 | Full resource naming table with examples for the target environment | Approve, add missing resources, or correct patterns |

## Audit

| Check | Pass condition |
|-------|----------------|
| Source stated | Output names which abbreviation source was used |
| Abbreviation accuracy | Every prefix matches the JSON, or is a documented IaC exception citing file and variable |
| Constraint compliance | Every example passes length, charset, and uniqueness for its type |
| No duplication | Doc references `icm/context/naming-standards.md`; does not restate the constraint table |
| Override coverage | Each resource lists its IaC override parameter, or explicitly "none" |
| Illustrative tokens marked | Example tokens are labelled as illustrative, not presented as real |
| Tool divergence | If both Bicep and Terraform exist, both documented and the difference flagged |

## Outputs

| Artifact | Location | Format |
|----------|----------|--------|
| Convention doc | `output/<workload-slug>-naming-conventions.md` | Per `references/output-format.md` |
| Quick reference | `output/<workload-slug>-naming-quickref.md` | Single table plus token formula |

Output is the human edit surface. Whatever a human leaves in `output/` is authoritative for anything downstream.
