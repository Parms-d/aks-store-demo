# Onboarding Questionnaire

Read this when the user types `setup`. Ask **all** questions in one pass — the user should be able to answer in a single message. These configure the factory, not a specific run.

---

### Q1: Organization or team name?
`{{ORG_NAME}}` → `icm/context/cloud-profile.md`

### Q2: Workload or application name?
`{{WORKLOAD_NAME}}` → `icm/context/cloud-profile.md`, `icm/context/project-infra-map.md`

### Q3: Azure subscription context? (name only, never a secret)
`{{SUBSCRIPTION_CONTEXT}}` → `icm/context/cloud-profile.md`

### Q4: Environment names?
`{{ENV_DEV}}`, `{{ENV_STAGING}}`, `{{ENV_PROD}}` → `icm/context/cloud-profile.md`, `icm/speckit/overrides/*`
Remove unused placeholders if fewer than three.

### Q5: Primary region?
`{{PRIMARY_REGION}}` → `icm/context/cloud-profile.md`

### Q6: Path to your infrastructure repository?
`{{PROJECT_PATH}}` → `icm/context/cloud-profile.md`, `icm/context/project-infra-map.md`
Example: `../platform-infra` or `/home/you/projects/platform`

### Q7: IaC tool and deployment tool?
`{{INFRA_TOOL}}` (`bicep` / `terraform` / `both`), `{{DEPLOY_TOOL}}` (`azd` / `cli` / `pipeline`)

### Q8: Paths inside the linked project?
`{{BICEP_MAIN_PATH}}`, `{{ABBREVIATIONS_PATH}}`, `{{PARAMETERS_PATH}}`, `{{TERRAFORM_PATH}}`, `{{HELM_PATH}}`

Defaults for azd-style repos:
- `infra/bicep/main.bicep`
- `infra/bicep/abbreviations.json`
- `infra/bicep/main.parameters.json`
- `infra/terraform`
- `charts/<workload>`

### Q9: Resource group naming pattern?
`{{RG_PATTERN}}` → `icm/context/naming-standards.md` — default `rg-{environmentName}`

### Q10: Required resource tags?
`{{TAG_1}}`, `{{TAG_2}}`, `{{TAG_3}}` → `icm/context/naming-standards.md`
Common default: `azd-env-name={environmentName}`

### Q11: Kubernetes namespace and Helm release? (skip if not applicable)
`{{K8S_NAMESPACE}}`, `{{HELM_RELEASE}}` → `icm/context/cloud-profile.md`

### Q12: Which Azure resource types does this workload deploy?
`{{RESOURCES_IN_SCOPE}}` → `icm/context/cloud-profile.md`
If the user is unsure, read the linked IaC entry point and propose the list for confirmation.

### Q13: Which coding agent are you using?
Determines the Spec Kit integration flag: `copilot`, `claude`, `cursor`, `gemini`, `generic`, …

---

## After the questionnaire

1. Replace every `{{PLACEHOLDER}}` across `icm/context/`, `icm/speckit/overrides/`, and `icm/ops/`
2. Grep for remaining `{{` and resolve anything left
3. Run `scripts/bootstrap-speckit.sh <integration>` to install Spec Kit and sync the constitution and template overrides
4. Confirm `.specify/memory/constitution.md` and `.specify/templates/overrides/` exist

Then tell the user:

> Configured for **{{WORKLOAD_NAME}}** in **{{PRIMARY_REGION}}**, linked to `{{PROJECT_PATH}}`.
> Lane A: `/speckit.specify <what you want to build>`
> Lane B: "generate naming conventions for {{ENV_DEV}}"
