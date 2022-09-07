output "cluster_sg" {
  description = "Cluster security group that was created by Amazon EKS for the cluster."
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

output "cluster_name" {
  description = "EKS Cluster Name."
  value       = aws_eks_cluster.main.id
}