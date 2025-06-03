variable "station_id" {
  type        = string
  description = "The id of the workload deployment"
}

variable "environment_name" {
  type        = string
  description = "The name of the workload deployment"
}

variable "workload_resource_group_name" {
  type        = string
  description = "The name of the resource group for the workload deployment"
}

variable "tags" {
  type        = map(string)
  description = "Tags passed on from Station Deployments"
  default     = {}
}

# tflint-ignore: terraform_unused_declarations
variable "user_assigned_identities" {
  description = "User Assigned Identities (Managed Identities) provisioned with Station"
  type = map(object({
    id           = string
    client_id    = string
    principal_id = string
  }))
  default = {}
}

# tflint-ignore: terraform_unused_declarations
variable "groups" {
  description = "Groups provisioned with Station"
  type = map(object({
    display_name = string
    object_id    = string
  }))
  default = {}
}

# tflint-ignore: terraform_unused_declarations
variable "applications" {
  description = "Applications provisioned with Station"
  type = map(object({
    client_id = string
    object_id = string
  }))
  default = {}
}

# tflint-ignore: terraform_unused_declarations
variable "resource_groups" {
  description = "User specified resource groups provisioned by Station"
  type = map(object({
    location = string
    name     = string
  }))
  default = {}
}
