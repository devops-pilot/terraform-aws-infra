provider "aws" {
  region = "us-east-1" # Change as needed
}

# ✅ VPC
module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  project  = "devops-lab"
}

# ✅ EKS (optional)
module "eks" {
  source          = "../../modules/eks"
  cluster_name    = "devops-eks"
  cluster_version = "1.27"
  vpc_id          = module.vpc.vpc_id
  subnets         = ["subnet-1", "subnet-2"]  # Replace with actual private subnet IDs
}

# ✅ EC2
module "ec2" {
  source             = "../../modules/ec2"
  ami_id             = "ami-0c55b159cbfafe1f0"  # Example: Amazon Linux 2 AMI
  instance_type      = "t2.micro"
  subnet_id          = "subnet-xxxxxxxx"       # Replace with actual subnet ID
  security_group_ids = ["sg-xxxxxxxx"]         # Replace with actual SG ID
  key_name           = "your-key-name"         # Replace with an actual key pair name
  project            = "devops-lab"
}

# ✅ ALB
module "alb" {
  source   = "../../modules/alb"
  project  = "devops-lab"
  vpc_id   = module.vpc.vpc_id
  subnets  = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]  # Replace with actual public subnet IDs
}
