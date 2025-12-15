# Application Landing Zone

Welcome to your application landing zone! This repository is your workspace for deploying Azure resources for your application.

## What You Get

- **A Resource Group** with Owner permissions - you can deploy any Azure resources here
- **Tags** that must be applied to all resources
- **Terraform Cloud** workspace for secure, automated deployments

## Architecture

![High Level Design](docs/diagrams/HLD.drawio.png)

## Documentation

> **📝 Please keep documentation updated!** As you build your application, update the docs to reflect your architecture, resources, and operational procedures.

| Document | Description |
|----------|-------------|
| [Getting Started](docs/getting-started.md) | How to use this landing zone and deploy resources |
| [Architecture](docs/architecture.md) | System architecture and components |
| [Resources](docs/resources.md) | Azure resources inventory and configuration |
| [Operations](docs/operations.md) | Deployment, monitoring, and troubleshooting |

## Quick Reference

```hcl
# Reference the resource group
data "azurerm_resource_group" "workload" {
  name = var.workload_resource_group_name
}

# Always include tags on resources
tags = var.tags

# Or merge with your own tags
tags = merge(var.tags, { component = "my-component" })
```

For detailed examples and instructions, see the [Getting Started Guide](docs/getting-started.md).
