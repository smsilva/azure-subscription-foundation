# Azure Subscription Foundation

This repository provides an way to bootstrap an Azure Subscription to use with Terraform.

Let's consider the below Tenant and Subscription ID:

```bash
export ARM_TENANT_ID="a267367d-d04d-4a6b-84ef-0cc227ed6e9f"
export ARM_SUBSCRIPTION_ID="636a465c-d6b1-4533-b071-64cea37a2bf6"
export ARM_SUBSCRIPTION_NAME="wasp-sandbox"
```

It will assume that there are a Service Principal with:

- Role Assignment: Contributor               - To create resources into the Subscription.
- Role Assignment: Owner                     - To create Role Assingments like AKS Managed Identity and DNS Zone Resource Group for external-dns.
- Client Secret Created                      - To fill ARM_CLIENT_SECRET environment variable.
- App Registration: API Permission           - Application.ReadWrite.All to Create others App Registration like the one used to configure ArgoCD SSO.
- Azure Kubernetes Service Cluster User Role - To enable users execute az aks get-credentials command.

```bash
export ARM_CLIENT_ID="2ef8b61a-e93b-453b-bb02-96e2394a518a"
export ARM_CLIENT_SECRET="DC4*************************************"
```

## 1. Resources Creation

1.1. Resource Group

```bash
wasp-foundation
```

1.1. Storage Account

```bash
waspfoundation${ARM_SUBSCRIPTION_ID:0:8}
```

1.2. Key Vault

```bash
waspfoundation${ARM_SUBSCRIPTION_ID:0:8}
```

## 2. Import Local Terraform State

Copy Local Terraform State to the Storage Account created in the previous step.
