# Project Infrastructure Map

Where infrastructure code lives in the **linked project**. Filled by `setup`. Read these paths live — never cache copies here.

> Linked project: `{{PROJECT_PATH}}`
> Workload: `{{WORKLOAD_NAME}}`
> Infra tool: `{{INFRA_TOOL}}`

## Paths

Relative to the linked project root.

| Path | Tool | Role |
|------|------|------|
| `{{BICEP_MAIN_PATH}}` | Bicep | Deployment entry point; name construction logic |
| `{{ABBREVIATIONS_PATH}}` | Bicep | CAF abbreviation dictionary |
| `{{PARAMETERS_PATH}}` | Bicep | Parameters and explicit name overrides |
| `{{TERRAFORM_PATH}}` | Terraform | Alternative IaC root |
| `{{HELM_PATH}}` | Helm | Kubernetes chart |

Resolve a file as `{{PROJECT_PATH}}/<relative path>`. Example: `../platform-infra/infra/bicep/main.bicep`.

If a path is empty or the file is missing, fall back to `icm/context/abbreviations.json` and say so in your output.

## What to Extract

When reading linked IaC for naming work:

| Item | Look for |
|------|----------|
| Abbreviation source | `loadJsonContent('./abbreviations.json')` or equivalent |
| Token formula | `resourceToken`, `uniqueString(...)`, `random_pet`, `random_integer` |
| Override params | `param *Name string = ''` guarded by `!empty(...)` |
| Custom prefixes | Hardcoded strings absent from the abbreviations JSON |
| Required tags | `tags = { ... }` blocks |

## Tool Divergence

Bicep and Terraform in the same repo usually generate **different** names — `uniqueString()` versus `random_pet`. Never present one as authoritative for both. Document each separately and flag the divergence.
