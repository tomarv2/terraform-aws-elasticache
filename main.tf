#
#NOTE: For working with Redis (Cluster Mode Enabled) replication groups
# see the aws_elasticache_replication_group resource.
#
resource "aws_elasticache_cluster" "default" {
  count = var.deploy_redis ? 1 : 0

  cluster_id               = var.cluster_id == null ? "${var.teamid}-${var.prjid}" : var.cluster_id
  engine                   = var.engine
  node_type                = var.node_type
  num_cache_nodes          = var.cache_nodes
  parameter_group_name     = var.deploy_redis_parameter_group == true ? join("", aws_elasticache_parameter_group.default.*.name) : ""
  engine_version           = var.engine_version
  port                     = var.port
  subnet_group_name        = aws_elasticache_subnet_group.default.name
  security_group_ids       = var.security_group_ids
  snapshot_arns            = var.snapshot_arns == [""] ? [] : var.snapshot_arns
  snapshot_window          = var.snapshot_window == "" ? null : var.snapshot_window
  snapshot_retention_limit = var.snapshot_retention_limit == "" ? null : var.snapshot_retention_limit
  az_mode                  = var.az_mode == null ? null : var.az_mode
  availability_zone        = var.availability_zone == null ? null : var.availability_zone
  tags                     = merge(local.shared_tags)
  notification_topic_arn   = var.notification_topic_arn == null ? null : var.notification_topic_arn
  apply_immediately        = var.apply_immediately == "" ? true : var.apply_immediately
  maintenance_window       = var.maintenance_window
}
