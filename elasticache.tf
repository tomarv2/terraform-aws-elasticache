# NOTE: For working with Redis (Cluster Mode Enabled) replication groups, see the aws_elasticache_replication_group resource.

resource "aws_elasticache_cluster" "elasticache" {
  cluster_id               = var.cluster_id == "" ? "${var.teamid}-${var.prjid}" : var.snapshot_name
  engine                   = var.engine
  node_type                = var.node_type
  num_cache_nodes          = var.cache_nodes
  parameter_group_name     = var.parameter_group_name
  engine_version           = var.engine_version
  port                     = var.port
  subnet_group_name        = var.subnet_group_name
  security_group_ids       = var.security_group_ids
  snapshot_arns            = var.snapshot_arns == "" ? "[]" :  var.snapshot_arns
  snapshot_name            = var.snapshot_name == "" ? "${var.teamid}-${var.prjid}" : var.snapshot_name
  snapshot_window          = var.snapshot_window == "" ? "null" :  var.snapshot_window
  snapshot_retention_limit = var.snapshot_retention_limit == "" ? "null" :  var.snapshot_retention_limit
  az_mode                  = var.az_mode == "" ? "null" :  var.az_mode
  availability_zone        = var.availability_zone
  tags                     = merge(local.shared_tags)
  notification_topic_arn   = var.notification_topic_arn == "" ? "null" :  var.notification_topic_arn
  apply_immediately        = var.apply_immediately == "" ? "true" :  var.apply_immediately
}
