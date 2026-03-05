# Terraform Practice Portfolio 🚀

Welcome to my Terraform Practice Portfolio!

This repository contains a collection of hands-on Terraform practices designed to help you master Infrastructure as Code (IaC) by deploying various AWS resources and architectures.

## 📂 Practice Structure

Each folder represents an independent Terraform practice with its own focus and learning objectives:

- [basic-ec2](basic-ec2): Deploy a simple AWS EC2 instance. Perfect for beginners to get familiar with Terraform basics and AWS resource provisioning.
- [web-server-ec2](web-server-ec2): Deploy a web server on a single EC2 instance with custom configuration. Great for understanding server provisioning and configuration management.
- [web-server-cluster](web-server-cluster): Set up a scalable web server cluster. Learn about load balancing and managing multiple instances for high availability.
- [multi-tier-webapp](multi-tier-webapp): Build a multi-tier web application architecture. Demonstrates how to organize infrastructure with separate layers like presentation, application, and data.

## 🚀 Getting Started

**NOTE**: These practices will deploy real resources into your AWS account. Remember to delete created resources to avoid charges on your AWS account.

Follow these steps to run any practice:

1. Clone the repository:
```bash
git clone https://github.com/keving5726/terraform-practice-portfolio.git
```
2. Navigate to the practice folder you want to try, for example:
```bash
cd terraform-practice-portfolio/basic-ec2
```
3. Initialize Terraform (downloads providers and configures backend):
```bash
terraform init
```
4. Preview the changes Terraform will make:
```bash
terraform plan
```
5. Apply the configuration to create resources:
```bash
terraform apply
```
6. When done, clean up resources to avoid costs:
```bash
terraform destroy
```

## 💡 Tips & Best Practices

- Each practice is self-contained, feel free to experiment without affecting others.
- Always run `terraform plan` before `terraform apply` to review changes.
- Check for any **README.md** file inside each practice folder for specific instructions.
- Remember to run `terraform destroy` at the end of the practice to avoid charges.
