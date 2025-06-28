module "ec2" {
  source             = "../../modules/ec2"
  ami_id             = "ami-0c55b159cbfafe1f0"  # Example: Amazon Linux 2 AMI
  instance_type      = "t2.micro"
  subnet_id          = "subnet-xxxxxxxx"       # Replace with actual subnet ID
  security_group_ids = ["sg-xxxxxxxx"]         # Replace with actual SG ID
  key_name           = "your-key-name"         # Replace with existing AWS key pair
  project            = "devops-lab"
}
