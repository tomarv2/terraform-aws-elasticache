resource "aws_elasticache_subnet_group" "default" {
  name       = var.cluster_id == null ? "${var.teamid}-${var.prjid}" : var.cluster_id
  subnet_ids = module.global.list_of_subnets[local.account_id][local.region]
}
