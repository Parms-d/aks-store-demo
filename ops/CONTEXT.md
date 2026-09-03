# Operational Stages (Lane B)

**Layer 2 index.** Recurring procedures with a fixed method and no design decisions. These do not get a spec, a branch, or a Spec Kit pipeline.

## Stages

| Stage | Produces | Contract |
|-------|----------|----------|
| `01-naming-conventions` | Naming convention doc + quick reference | `01-naming-conventions/CONTEXT.md` |

## Stage Contract Shape

Every stage `CONTEXT.md` has the same five sections, in this order:

1. **Inputs** — a table naming the file *and the section within it* to load
2. **Process** — numbered steps
3. **Checkpoints** — where to stop for a human
4. **Audit** — pass conditions checked before writing output
5. **Outputs** — artifact, location, format

The Inputs table is the control point. If a file is not in it, do not load it.

## Output Naming

Predictable filenames replace an index or database.

| Artifact | Pattern |
|----------|---------|
| Convention doc | `output/<workload-slug>-naming-conventions.md` |
| Quick reference | `output/<workload-slug>-naming-quickref.md` |

`workload-slug` is lowercase and hyphenated. Append `-v2`, `-v3` only when superseding a doc you are keeping.

## When a Stage Stops Being Lane B

If running a stage requires choosing between approaches, weighing trade-offs, or changing infrastructure, stop. Promote it to Lane A with `/speckit.specify` and let the SDD pipeline handle the decision. Stage contracts describe procedures, not designs.
