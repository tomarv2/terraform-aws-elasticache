terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 3.74"
    }
  }
}

provider "aws" {
  region = var.region
}

module "redis" {
  source = "../"

  deploy_redis                 = true
  deploy_redis_parameter_group = true

  security_group_ids = [module.security_group.security_group_id]
  # ----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "security_group" {
  source = "git::git@github.com:tomarv2/terraform-aws-security-group.git?ref=v0.0.6"

  deploy_security_group = true

  service_ports = [6379]
  teamid        = var.teamid
  prjid         = var.prjid
}
