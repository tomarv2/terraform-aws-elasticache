output "cluster_id" {
  value       = [for i in aws_elasticache_cluster.this : i.id]
  description = "Elasticache Id"
}

output "cluster_address" {
  value       = [for i in aws_elasticache_cluster.this : i.cluster_address]
  description = "Elasticache Cluster address"
}

output "parameter_group" {
  description = "Elasticache Parameter Group"
  value       = [for i in aws_elasticache_parameter_group.this : i.name]
}
