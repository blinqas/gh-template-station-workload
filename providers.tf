terraform {
  required_version = "~> 1.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }

  # Included so all new workspaces can be init, validate and planned locally.
  # Documentation: https://developer.hashicorp.com/terraform/cli/cloud/settings
  # 
  # Set the following environment variables before you run terraform init.
  # - TF_CLOUD_ORGANIZATION - The name of the Terraform Cloud organization
  # - TF_WORKSPACE - The name of the workspace in Terraform Cloud
  cloud {}
}

provider "azurerm" {
  features {}
}

