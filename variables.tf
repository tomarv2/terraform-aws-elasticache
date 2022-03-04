variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "cluster_id" {
  default     = null
  description = "Group identifier. ElastiCache converts this name to lowercase"
  type        = string
}

variable "node_type" {
  default     = "cache.t2.micro"
  description = "The compute and memory capacity of the nodes"
  type        = string
}

variable "cache_nodes" {
  description = "The initial number of cache nodes that the cache cluster will have. For Redis, this value must be 1. For Memcache, this value must be between 1 and 20."
  default     = 1
  type        = number
}


variable "engine_version" {
  default     = "5.0.6"
  description = "Version of engine"
  type        = string
}

variable "port" {
  description = "The port number on which each of the cache nodes will accept connections. For Memcache the default is 11211, and for Redis the default port is 6379."
  default     = 6379
  type        = number
}

variable "security_group_ids" {
  description = "One or more VPC security groups associated with the cache cluster"
  type        = string
}

variable "snapshot_window" {
  default     = ""
  description = "Daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. Example: 05:00-09:00."
  type        = string
}

variable "snapshot_retention_limit" {
  description = "Number of days snapshot image will be retained"
  default     = 5
  type        = number
}

variable "engine" {
  default     = "redis"
  description = "Name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached or redis."
  type        = string
}

variable "notification_topic_arn" {
  description = "An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic."
  default     = null
  type        = string
}

variable "snapshot_arns" {
  description = "A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my_bucket/snapshot1.rdb"
  default     = [""]
  type        = list(any)
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false."
  default     = true
  type        = bool
}

variable "az_mode" {
  description = "(Memcached only) Specifies whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region. Valid values for this parameter are single-az or cross-az, default is single-az. If you want to choose cross-az, num_cache_nodes must be greater than 1."
  default     = null
  type        = string
}

variable "deploy_redis" {
  description = "Feature flag, true or false"
  default     = true
  type        = bool
}

variable "availability_zone" {
  default     = null
  description = "The Availability Zone for the cache cluster. If you want to create cache nodes in multi-az, use preferred_availability_zones instead. Default: System chosen Availability Zone. Changing this value will re-create the resource."
  type        = string
}

variable "deploy_redis_parameter_group" {
  description = "Feature flag, true or false"
  default     = true
  type        = bool
}

variable "cluster_mode_enabled" {
  type        = bool
  description = "Flag to enable/disable creation of a native redis cluster. `automatic_failover_enabled` must be set to `true`. Only 1 `cluster_mode` block is allowed"
  default     = false
}

variable "parameter" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another"
}

variable "parameter_group_family" {
  default     = "redis5.0"
  description = "The family of the ElastiCache parameter group"
  type        = string
}

variable "maintenance_window" {
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. "
  default     = "mon:10:30-mon:11:30"
  type        = string
}
