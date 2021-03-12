output "elasticache_id" {
  value = module.redis.elasticache_id
}

output "elasticache_cluster_address" {
  value = module.redis.elasticache_cluster_address
}

output "aws_elasticache_parameter_group" {
  value = module.redis.aws_elasticache_parameter_group
}

output "security_group_id" {
  value = module.security_group.security_group_id
}