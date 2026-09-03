# Naming Standards

Canonical naming rules. Every spec, plan, and stage output references this file rather than restating rules.

## Philosophy

Follow [Azure CAF naming](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming):

1. **Prefix** — CAF abbreviation for the resource type
2. **Unique suffix** — deterministic token, typically `toLower(uniqueString(subscription().id, environmentName, location))`
3. **Override** — explicit name parameters in IaC win over generated names

## Patterns

| Scope | Pattern |
|-------|---------|
| Resource group | `{{RG_PATTERN}}` (default `rg-{environmentName}`) |
| Most resources | `{abbreviation}{resourceToken}` |
| Hyphen-forbidden types | `{abbreviation}{resourceToken}` with no separator (e.g. ACR, storage) |

## Common Prefixes

Authoritative source is `context/abbreviations.json`. This table is a convenience index, not a replacement.

| Resource | Abbreviation key | Prefix |
|----------|------------------|--------|
| Resource group | `resourcesResourceGroups` | `rg-` |
| AKS cluster | `containerServiceManagedClusters` | `aks-` |
| Key Vault | `keyVaultVaults` | `kv-` |
| Cosmos DB | `documentDBDatabaseAccounts` | `cosmos-` |
| Service Bus | `serviceBusNamespaces` | `sb-` |
| Log Analytics | `operationalInsightsWorkspaces` | `log-` |
| Managed identity | `managedIdentityUserAssignedIdentities` | `id-` |
| Cognitive Services | `cognitiveServicesAccounts` | `cog-` |
| Container Registry | `containerRegistryRegistries` | `cr` |
| Storage account | `storageStorageAccounts` | `st` |

Prefixes not present in the JSON (hardcoded in IaC, e.g. `amon-`, `amg-`) must be documented as explicit exceptions with a pointer to the file and line that defines them.

## Constraints

| Resource | Length | Charset | Globally unique |
|----------|--------|---------|-----------------|
| Resource group | 1–90 | Alphanumeric, `_ . ( ) -` | No |
| Key Vault | 3–24 | Alphanumeric, `-` | Yes |
| Storage account | 3–24 | Lowercase alphanumeric | Yes |
| AKS cluster | 1–63 | Alphanumeric, `-` | No |
| Cosmos DB account | 3–44 | Lowercase alphanumeric, `-` | Yes |
| Service Bus namespace | 6–50 | Alphanumeric, `-` | Yes |
| Log Analytics workspace | 4–63 | Alphanumeric, `-` | No |
| Container registry | 5–50 | Alphanumeric only | Yes |

Full rules: [Azure resource name rules](https://learn.microsoft.com/azure/azure-resource-manager/management/resource-name-rules).

## Required Tags

| Tag | Value source |
|-----|--------------|
| {{TAG_1}} | |
| {{TAG_2}} | |
| {{TAG_3}} | |

## Validation Procedure

Before accepting any generated name:

1. Length within the resource-type limit
2. Charset legal for that type
3. Global uniqueness satisfied where required
4. Prefix traceable to `abbreviations.json` or a documented IaC exception
5. Override parameter identified, if the IaC exposes one
