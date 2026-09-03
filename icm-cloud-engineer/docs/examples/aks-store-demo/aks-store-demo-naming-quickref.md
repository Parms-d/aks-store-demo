# aks-store-demo Naming Quick Reference

| Resource | Pattern | Override Param |
|----------|---------|----------------|
| Resource group | `rg-{env}` | `resourceGroupName` |
| AKS | `aks-{token}` | `kubernetesName` |
| Key Vault | `kv-{token}` | `keyVaultName` |
| Managed identity | `id-{token}` | `identityName` |
| Cosmos DB | `cosmos-{token}` | none |
| Service Bus | `sb-{token}` | `servicebusName` |
| Log Analytics | `log-{token}` | `logAnalyticsName` |
| Monitor workspace | `amon-{token}` | `monitorAccountName` |
| Managed Grafana | `amg-{token}` | none |
| OpenAI | `cog-{token}` | `openAiServiceName` |
| Container Registry | `cr{token}` | `containerRegistryName` |

**Token** — `toLower(uniqueString(subscription().id, environmentName, location))`, computed at deploy time
**Tag** — `azd-env-name={environmentName}`
**Kubernetes** — namespace `pets`, release `demo`

`amon-` and `amg-` are hardcoded in `main.bicep`, not CAF abbreviations.
Terraform (`locals.tf`) generates different names — do not mix.

Full document: `aks-store-demo-naming-conventions.md`
