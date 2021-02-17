module "efs" {
  source = "../../.."

  teamid                   = var.teamid
  prjid                    = var.prjid
  email                    = var.email
  profile_to_use           = var.profile_to_use
  cluster_identifier       = var.cluster_identifier
  engine                   = var.engine
  node_type                = var.node_type
  num_cache_nodes          = var.cache_nodes
  parameter_group_name     = var.parameter_group_name
  engine_version           = var.engine_version
  port                     = var.port
  subnet_group_name        = var.subnet_group_name
  security_group_ids       = var.security_group_ids
  snapshot_window          = var.snapshot_window
  snapshot_retention_limit = var.snapshot_retention_limit
  availability_zone        = var.availability_zone
}
