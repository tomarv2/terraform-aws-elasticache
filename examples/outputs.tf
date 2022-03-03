output "elasticache_id" {
  description = "Elasticache Id"
  value       = module.redis.elasticache_id
}

output "elasticache_cluster_address" {
  description = "Elasticache Cluster address"
  value       = module.redis.elasticache_cluster_address
}

output "aws_elasticache_parameter_group" {
  description = "Elasticache Parameter Group"
  value       = module.redis.aws_elasticache_parameter_group
}

output "security_group_id" {
  description = "Security group Id"
  value       = module.security_group.security_group_id
}
