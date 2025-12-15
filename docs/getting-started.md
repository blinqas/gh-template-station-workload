<!-- Do not edit this as this should be used by new users to understand how to deploy new resources -->
# Getting Started Guide

This guide explains how to use your application landing zone to deploy Azure resources.

## Using the Resource Group

Your resource group is already provisioned. Reference it using the data source:

```hcl
# The resource group is available via data source
data "azurerm_resource_group" "workload" {
  name = var.workload_resource_group_name
}

# Deploy resources to your resource group
resource "azurerm_storage_account" "example" {
  name                     = "myappstorageaccount"
  resource_group_name      = data.azurerm_resource_group.workload.name
  location                 = data.azurerm_resource_group.workload.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}
```

## Applying Tags

**All resources must include the provided tags** for cost tracking and governance. Use `var.tags` and merge with your own tags if needed:

```hcl
# Using only the required tags
resource "azurerm_storage_account" "simple" {
  name                     = "mystorageaccount"
  resource_group_name      = data.azurerm_resource_group.workload.name
  location                 = data.azurerm_resource_group.workload.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

# Merging with your own tags
resource "azurerm_storage_account" "with_custom_tags" {
  name                     = "mystorageaccount"
  resource_group_name      = data.azurerm_resource_group.workload.name
  location                 = data.azurerm_resource_group.workload.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = merge(var.tags, {
    component   = "backend"
    environment = "production"
  })
}
```

## Deploying Changes

1. Clone this repository
2. Add your Terraform resources to deploy your application
3. Always use `data.azurerm_resource_group.workload` for resource group references
4. Always include `var.tags` (or merged tags) on all resources
5. Push changes - Terraform Cloud will plan and apply automatically

## Permissions

You have **Owner** permissions on your resource group. This means you can:

- ✅ Create, update, and delete any Azure resources in your resource group
- ✅ Assign roles within your resource group
- ❌ Access resources outside your resource group (unless explicitly granted)
- ❌ Create Entra ID resources (groups, applications, managed identities)

**Need more permissions?** Contact IT to request:
- Access to shared services (e.g., Log Analytics Workspace for logging)
- Entra ID resources (groups, applications, managed identities)
- Access to other resource groups or subscriptions

## Additional Resources from IT

If approved, IT can provision and pass additional resources to your landing zone:

| Resource | Use Case |
|----------|----------|
| User Assigned Identities | When your app needs access to resources outside this resource group |
| Entra ID Groups | If you want to use them to control permissions to your resources or your app needs them for something else |
| Entra ID Applications | For app registrations and service principals |
| Additional Resource Groups | When you need resources in multiple resource groups |

These are accessed via variables (`var.user_assigned_identities`, `var.groups`, `var.applications`, `var.resource_groups`).
