module "redis" {
  source = "../"

  deploy_redis                 = true
  deploy_redis_parameter_group = true

  security_group_ids           = [module.security_group.security_group_id]
  account_id                   = "755921336062"
  email                        = "varun.tomar@databricks.com"
  # ----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "security_group" {
  source = "git::git@github.com:tomarv2/terraform-aws-security-group.git?ref=v0.0.1"

  deploy_security_group = true

  service_ports = [6379]
  email         = "varun.tomar@databricks.com"
  teamid        = var.teamid
  prjid         = var.prjid
}

