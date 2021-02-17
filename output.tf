output "elasticache_id" {
  value = aws_elasticache_cluster.elasticache.id
}

output "elasticache_snapshot_name" {
  value = aws_elasticache_cluster.elasticache.snapshot_name
}

output "elasticache_cluster_address" {
  value = aws_elasticache_cluster.elasticache.cluster_address
}
