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
│   ├── asg/
│   └── eks/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       └── backend.tf
└── README.md
