# terraform-aws-infra

🚀 Terraform modules for building scalable, production-ready AWS infrastructure on AWS (and GCP soon).

---

## 💡 Features

- 🏗️ VPC with public/private subnets
- 🌐 Internet Gateway & NAT Gateway
- 🖥️ EC2 instance provisioning with Security Groups
- ⚖️ Application Load Balancer (ALB)
- 📈 Auto Scaling Group with Launch Template
- ☸️ EKS cluster deployment (optional)
- 🪄 Modular, reusable structure
- 🔐 Remote backend support (S3 + DynamoDB)

---

## 📁 Project Structure

```text
terraform-aws-infra/
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── alb/
│   └── eks/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       └── backend.tf
└── README.md
```

---
## 🧪 Getting Started

### 📌 Prerequisites

- Terraform v1.3+
- AWS CLI authenticated (`aws configure`)
- An AWS Key Pair (for EC2/ASG modules)

## 🛠️ Bootstrap Remote Backend
### Create backend resources using the configuration below before running any Terraform modules. This sets up:

- An S3 bucket for remote state storage
- A DynamoDB table for state locking

### 📄 `backend-bootstrap/main.tf`

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "devops-pilot-terraform-state"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "dev"
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-locks"
```

### Then run:
```
cd backend-bootstrap
terraform init
terraform apply
```
## 📦 Usage Example
``` In environments/dev/backend.tf:```
```terraform {
  backend "s3" {
    bucket         = "devops-pilot-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```
## 🚧 To Do
- VPC Module ✅
- EC2 Module ✅
- ALB + Auto Scaling Group ✅
- EKS Cluster Module ✅
- Remote Backend (S3 + DynamoDB) ✅
- Monitoring stack (Prometheus, Grafana)
- CI/CD pipeline (GitHub Actions / GitLab CI)

## 📜 License
- MIT License. Feel free to fork, customize, and improve!

## 🤝 Contributions
##### Pull requests are welcome. Ideas for GCP, CI/CD, and observability modules are appreciated!
