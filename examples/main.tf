terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 4.35"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "redis" {
  source = "../"

  config = {
    demo = {
      security_group_ids = module.security_group.id
      engine_version     = "6.2"
      family             = "redis6.x"
      parameter_group_config = {
        activerehashing = {
          value = "yes"
        }
      }
    }
  }
}

module "security_group" {
  #source = "git::git@github.com:tomarv2/terraform-aws-security-group.git?ref=v0.0.12"
  source = "../../terraform-aws-security-group"
  config = {
    demo_redis = {
      all_ingress_rules = [
        {
          description = "https"
          type        = "ingress"
          from_port   = 6379
          protocol    = "tcp"
          to_port     = 6379
          self        = true
          cidr_blocks = []
        }
      ]
      all_egress_rules = [
        {
          description = "outbound traffic"
          from_port   = 0
          protocol    = "-1"
          type        = "egress"
          to_port     = 0
          self        = false
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
  }
}
