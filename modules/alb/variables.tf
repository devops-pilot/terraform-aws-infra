variable "vpc_id" {
  description = "VPC ID where the ALB is deployed"
  type        = string
}

variable "subnets" {
  description = "List of public subnets for the ALB"
  type        = list(string)
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}
