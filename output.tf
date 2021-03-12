output "elasticache_id" {
  value = join("", aws_elasticache_cluster.default.*.id)
}

output "elasticache_cluster_address" {
  value = aws_elasticache_cluster.default.*.cluster_address
}

output "aws_elasticache_parameter_group" {
  value = join("", aws_elasticache_parameter_group.default.*.name)
}
