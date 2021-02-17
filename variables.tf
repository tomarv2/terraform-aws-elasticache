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

variable "cluster_id" {
  deafult     = ""
  description = "(Required) Group identifier. ElastiCache converts this name to lowercase."
}

variable "node_type" {
  type        = "string"
  description = "The compute and memory capacity of the nodes."
}

variable "cache_nodes" {
  description = "The initial number of cache nodes that the cache cluster will have. For Redis, this value must be 1. For Memcache, this value must be between 1 and 20."
  default     = 1
}

variable "parameter_group_name" {
  type        = "string"
  description = "Name of the parameter group to associate with this cache cluster."
}

variable "engine_version" {
  type        = "string"
  description = "Version of engine"
}

variable "port" {
  description = "The port number on which each of the cache nodes will accept connections. For Memcache the default is 11211, and for Redis the default port is 6379."
  default     = 6379
}

variable "subnet_group_name" {
  type        = "string"
  description = "Name of the subnet group to be used for the cache cluster."
}

variable "security_group_ids" {
  type        = "list"
  description = "One or more VPC security groups associated with the cache cluster."
}

variable "snapshot_window" {
  type        = "string"
  description = "he daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. Example: 05:00-09:00."
}

variable "snapshot_retention_limit" {
  description = "Number of days snapshot image will be retained"
  default     = 5
}

variable "availability_zone" {
  type        = "string"
  description = "The Availability Zone for the cache cluster. If you want to create cache nodes in multi-az, use preferred_availability_zones instead. Default: System chosen Availability Zone."
}

variable "engine" {
  default     = "redis"
  description = "Name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached or redis."
}

variable "profile_to_use" {
  description = "Getting values from ~/.aws/credentials"
}

variable "aws_region" {
  default     = "us-west-2"
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
}

variable "notification_topic_arn" {
  description = "An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic."
}

variable "snapshot_arns" {
  description = "A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my_bucket/snapshot1.rdb"
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false."
}

variable "az_mode" {
  description = "(Optional, Memcached only) Specifies whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region. Valid values for this parameter are single-az or cross-az, default is single-az. If you want to choose cross-az, num_cache_nodes must be greater than 1."
}

variable "snapshot_name" {
  default     = ""
  description = "(Optional) The name of a snapshot from which to restore data into the new node group. Changing the snapshot_name forces a new resource."
}