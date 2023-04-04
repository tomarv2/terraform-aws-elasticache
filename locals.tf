module "global" {
  source = "github.com/tomarv2/terraform-global.git//aws?ref=v0.0.1"
}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
