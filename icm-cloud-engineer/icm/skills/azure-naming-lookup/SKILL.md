---
name: azure-naming-lookup
description: Resolve Azure CAF abbreviations and validate resource names against Azure constraints. Use during Spec Kit plan/implement steps or the naming conventions stage.
---

# Azure Naming Lookup

Load only when actively resolving an abbreviation or validating a name. Not a general reference.

## Procedure

### 1. Resolve the abbreviation

1. Read the linked project path and abbreviations path from `icm/context/project-infra-map.md`
2. Look up the key for the resource type — e.g. `keyVaultVaults` → `kv-`
3. Missing or unreadable? Fall back to `icm/context/abbreviations.json` and record that you did
4. Still missing? Check the linked IaC entry point for a hardcoded prefix, and cite the file and variable
5. Last resort: [CAF abbreviations](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)

### 2. Build the name

```
{abbreviation}{resourceToken}
```

Resource groups typically use the environment name instead of the token.

Take the token formula from the linked IaC rather than assuming. Present the **pattern**, not a fabricated token — unless the user supplies a subscription ID and asks for a real `uniqueString` result, in which case say it must be computed at deploy time.

### 3. Validate

| Check | Against |
|-------|---------|
| Length | Constraints table in `icm/context/naming-standards.md` |
| Charset | Same table — note hyphen-forbidden types |
| Uniqueness | Same table — flag globally unique types |
| Override | Parameter name from the linked IaC, or "none" |

### 4. Return

One row per resource:

| Resource | Pattern | Example | Override Param | Constraints |

## Do Not

- Invent an abbreviation absent from the JSON and the IaC
- Paste the whole abbreviations file into output
- Present a fabricated token as a real deployed name
- Imply Bicep naming applies to Terraform, or the reverse
