output "elasticache_id" {
  value       = join("", aws_elasticache_cluster.default.*.id)
  description = "Elasticache Id"
}

output "elasticache_cluster_address" {
  value       = aws_elasticache_cluster.default.*.cluster_address
  description = "Elasticache Cluster address"
}

output "aws_elasticache_parameter_group" {
  description = "Elasticache Parameter Group"
  value       = join("", aws_elasticache_parameter_group.default.*.name)
}
