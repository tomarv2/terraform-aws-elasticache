cluster_identifier                  = "terraformtestcluster"
node_type                           = "cache.m4.large"
cache_nodes                         = 1
parameter_group_name                = "default.redis3.2"
engine_version                      = "3.2.10"
port                                = 6379
subnet_group_name                   = "test"
security_group_ids                  = ["sg-xxxxxxxxxx"]
snapshot_window                     = "05:00-09:00"
snapshot_retention_limit            = 5
availability_zone                   = "us-west-2b"
# ------------------------------------------------------------------
# Note: Do not change teamid and prjid once set.
teamid                              = "rumse"
prjid                               = "demo-redis"