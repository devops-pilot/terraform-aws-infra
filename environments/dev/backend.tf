terraform {
  backend "s3" {
    bucket         = "devops-pilot-terraform-state"       # ✅ Change this to your bucket name
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"                           # ✅ Change if needed
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
