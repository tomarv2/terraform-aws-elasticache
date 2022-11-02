#
#NOTE: For working with Redis (Cluster Mode Enabled) replication groups
# see the aws_elasticache_replication_group resource.
#
resource "aws_elasticache_cluster" "this" {
  for_each             = var.config
  cluster_id           = each.key
  engine               = try(each.value.engine, "redis")
  node_type            = try(each.value.node_type, "cache.t2.micro")
  num_cache_nodes      = try(each.value.num_cache_nodes, 1)
  parameter_group_name = try(each.value.parameter_group_config, null) == null ? "" : join("", [for entry in aws_elasticache_parameter_group.this : entry.name])
  engine_version       = try(each.value.engine_version, "6.2")
  port                 = try(each.value.port, 6379)
  #subnet_group_name        = module.global.list_of_subnets[local.account_id][local.region]
  security_group_ids       = try(each.value.security_group_ids, "")
  snapshot_arns            = try(each.value.snapshot_arns, [])
  snapshot_window          = try(each.value.snapshot_window, "")
  snapshot_retention_limit = try(each.value.snapshot_retention_limit, 5)
  az_mode                  = try(each.value.az_mode, null)
  availability_zone        = try(each.value.availability_zone, null)
  notification_topic_arn   = try(each.value.notification_topic_arn, null)
  apply_immediately        = try(each.value.apply_immediately, true)
  maintenance_window       = try(each.value.maintenance_window, "mon:10:30-mon:11:30")
  tags                     = merge(local.shared_tags, var.extra_tags)
}

locals {
  parameter_group_settings = flatten([
    for instance, config in var.config : [
      for k, v in config.parameter_group_config : {
        name            = instance
        family          = try(config.family, "redis6.0")
        parameter_name  = k
        parameter_value = v.value
      }
  ]])
}

resource "aws_elasticache_parameter_group" "this" {
  for_each = { for i in local.parameter_group_settings : i.parameter_name => i }
  name     = each.value.name
  family   = each.value.family

  dynamic "parameter" {
    for_each = { for i in local.parameter_group_settings : i.parameter_name => i }
    content {
      name  = parameter.value.parameter_name
      value = parameter.value.parameter_value
    }
  }
}
