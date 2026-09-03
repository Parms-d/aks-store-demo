# Cloud Profile

> Placeholders are filled by `setup`. See `setup/questionnaire.md`.

## Organization

| Field | Value |
|-------|-------|
| Organization | {{ORG_NAME}} |
| Workload | {{WORKLOAD_NAME}} |
| Subscription context | {{SUBSCRIPTION_CONTEXT}} |
| Primary region | {{PRIMARY_REGION}} |

## Environments

| Environment | Purpose | Region |
|-------------|---------|--------|
| {{ENV_DEV}} | Development | {{PRIMARY_REGION}} |
| {{ENV_STAGING}} | Staging | {{PRIMARY_REGION}} |
| {{ENV_PROD}} | Production | {{PRIMARY_REGION}} |

## Linked Project

The infrastructure repository this workspace operates on.

| Field | Value |
|-------|-------|
| Local path | {{PROJECT_PATH}} |
| Infra tool | {{INFRA_TOOL}} |
| Deployment tool | {{DEPLOY_TOOL}} |

## Kubernetes

| Field | Value |
|-------|-------|
| Namespace | {{K8S_NAMESPACE}} |
| Helm release | {{HELM_RELEASE}} |

## Resource Types in Scope

List the Azure resource types this workload deploys. Stage and plan steps read this to know what to document.

{{RESOURCES_IN_SCOPE}}
