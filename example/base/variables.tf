# Additional documentation: https://www.terraform.io/docs/configuration/variables.html
variable "email" {
  description = "email address to be used for tagging (suggestion: use group email address)"
}

variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "cluster_identifier" {
  type        = "string"
  description = "Identifier of new cluster"
}

variable "node_type" {
  type        = "string"
  description = "Type of node."
}

variable "cache_nodes" {
  description = "Number of cache nodes"
  default     = 1
}

variable "parameter_group_name" {
  type        = "string"
  description = "Name of parameter group."
}

variable "engine_version" {
  type        = "string"
  description = "Version of engine"
}

variable "port" {
  description = "Port for cluster."
  default     = 6379
}

variable "subnet_group_name" {
  type        = "string"
  description = "Name of subnet group."
}

variable "security_group_ids" {
  type        = "list"
  description = "List of security groups."
}

variable "snapshot_window" {
  type        = "string"
  description = "Time of day when snapshot will be taken."
}

variable "snapshot_retention_limit" {
  description = "Number of days snapshot image will be retaind"
  default     = 5
}

variable "availability_zone" {
  type        = "string"
  description = "Availability zone"
}

variable "engine" {
  default     = "redis"
}

variable "profile_to_use" {
  description = "Getting values from ~/.aws/credentials"
}

variable "aws_region" {
  default = "us-west-2"
}