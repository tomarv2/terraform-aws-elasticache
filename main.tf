locals {
  shared_tags = map(
    "name", "${var.teamid}-${var.prjid}",
    "owner", var.email,
    "team", var.teamid,
    "project", var.prjid
  )
}

module "global" {
  source = "git::git@github.com:tomarv2/terraform-global.git//aws?ref=v0.0.1"
}