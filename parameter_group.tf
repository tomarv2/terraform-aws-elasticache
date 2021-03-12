resource "aws_elasticache_parameter_group" "default" {
  count = var.deploy_redis_parameter_group ? 1 : 0

  name   = var.cluster_id == null ? "${var.teamid}-${var.prjid}" : var.cluster_id
  family = var.parameter_group_family


  dynamic "parameter" {
    for_each = var.cluster_mode_enabled ? concat([{ name = "cluster-enabled", value = "yes" }], var.parameter) : var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}

