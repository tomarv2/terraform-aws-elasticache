output "cluster_id" {
  value       = module.redis.cluster_id
  description = "Elasticache Id"
}

output "cluster_address" {
  value       = module.redis.cluster_address
  description = "Elasticache Cluster address"
}

output "parameter_group" {
  description = "Elasticache Parameter Group"
  value       = module.redis.parameter_group
}

output "security_group_id" {
  description = "Security group Id"
  value       = module.security_group.id
}
