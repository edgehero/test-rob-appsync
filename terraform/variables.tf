variable "component_version" {
  type        = string
  description = "Version to deploy"
}

variable "environment" {
  type        = string
  description = "Specify what environment it's in (e.g. `test` or `production`)"
}

variable "site" {
  type        = string
  description = "Identifier of the site"
}

variable "variables" {
  type        = any
  description = "Generic way to pass variables to components."
}

variable "secrets" {
  type        = any
  description = "Map of secret values. Can be placed in a key vault."
}

variable "tags" {
  type        = map(string)
  description = "Tags to be used on resources."
}