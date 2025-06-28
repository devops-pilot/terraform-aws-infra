output "cluster_name" {
  value = module.eks.cluster_name
}


output "node_group_role_arn" {
  value = module.eks.eks_managed_node_groups.default.node_group_arn
}
