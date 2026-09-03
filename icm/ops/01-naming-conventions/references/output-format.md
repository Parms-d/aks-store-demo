# Output Format

Required shape for stage 01 artifacts. This file governs **layout only** — naming rules live in `icm/context/naming-standards.md` and are referenced, never copied.

## Convention Document

Sections in this order:

### 1. Header

Workload, environment, region, abbreviation source used, and date.

### 2. How Names Are Built

The token formula quoted from the linked IaC, plus the two patterns (standard resource, resource group). Cite the file it came from.

### 3. Resource Naming Table

One row per resource type in scope:

| Column | Content |
|--------|---------|
| Azure Resource | Human-readable type |
| Abbreviation | Prefix string |
| Name Pattern | Template with `{token}` / `{environmentName}` placeholders |
| Override Parameter | IaC parameter name, or "none" |
| Example | Illustrative name, explicitly labelled |
| Constraints | Length and uniqueness note |

### 4. Required Tags

Link to `icm/context/naming-standards.md` — Required Tags. Do not restate the table.

### 5. Kubernetes Naming

Namespace, Helm release, chart. Only if the workload runs on Kubernetes.

### 6. Override Example

A minimal parameters-file snippet showing how to pin an explicit name.

### 7. Canonical Sources

Paths to the abbreviations file and IaC entry point used, plus the CAF link.

### 8. Divergence Notes

Any Bicep/Terraform mismatch, hardcoded prefix, or resource excluded from the pattern.

## Quick Reference

One table (Resource, Pattern, Override Param), the token formula, required tags line, Kubernetes line, and a pointer to the full doc. Must fit on one screen.

## Rules

- Label every example token as illustrative
- Never paste the full abbreviations JSON
- Every hardcoded prefix cites the file and variable that defines it
