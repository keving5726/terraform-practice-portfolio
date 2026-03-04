# Terraform Practice: AWS EC2 Instance

## Objective
This practice aims to demonstrate the basics of using Terraform to provision infrastructure on AWS by creating a simple EC2 instance. It is designed as a starting point for learning Infrastructure as Code (IaC) with Terraform.

## Infrastructure Overview
In this project, Terraform is used to create a single AWS EC2 instance with the following characteristics:
- Amazon Linux 2023 AMI 2023.10.20260120.4 arm64 HVM kernel-6.12.
- **t4g.micro** instance type (eligible for AWS free tier).
- Default VPC and subnet.

### Architecture Diagram

<div align="center">
  <img width="721" height="231" alt="basic-ec2 drawio" src="https://github.com/user-attachments/assets/a80dc0db-abc9-4d3d-86a8-926ff8129578" />
</div>

### Flowchart

<div align="center">  
  <img width="549" height="181" alt="basic-ec2-flow drawio" src="https://github.com/user-attachments/assets/7a3eb31a-0722-4878-a4bd-f8a6c80d7c4e" />
</div>

1. Write Terraform configuration files.
2. Initialize Terraform with `terraform init`.
3. Deploy the EC2 instance with `terraform apply`.
4. Clean up with `terraform destroy`.

### Terraform Dependency Graph

<div align="center">
  <img width="815" height="539" alt="graphviz" src="https://github.com/user-attachments/assets/1b685485-a6de-4049-bd05-d3d12d18a7f8" />  
</div>

The goal is to get familiar with Terraform configuration files, providers, resources, and basic commands.

## How to Run

**NOTE:** This example will deploy real resources into your AWS account.
Remember to delete created resources to avoid charges on your AWS account.

### Pre-requisites

- Terraform installed (version v1.14.4 or higher recommended).
- AWS CLI configured with your credentials and default region.
- An AWS account with permissions to create EC2 instances.

### Steps

Initialize Terraform (downloads provider plugins):
```bash
terraform init
```

Preview the infrastructure changes Terraform will apply:
```bash
terraform plan
```

Apply the configuration to create the EC2 instance:
```bash
terraform apply
```

Clean up when you're done:
```bash
terraform destroy
```

This practice is a foundational step to understand Terraform workflow and AWS resource provisioning.
You can extend this by adding variables, outputs, and more complex resources in future practices.
