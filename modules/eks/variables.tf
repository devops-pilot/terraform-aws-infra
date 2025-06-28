variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  default     = "1.27"
  description = "Kubernetes version"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to deploy EKS into"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for EKS cluster and node group"
}

variable "project" {
  type        = string
  description = "Project name for tagging"
}
