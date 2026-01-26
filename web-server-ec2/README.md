# Terraform Practice: Web Server using an AWS EC2 Instance

## Objective
This practice aims to demonstrate the basics of using Terraform to provision infrastructure on AWS by creating a web server using an EC2 instance. It is designed as a starting point for learning Infrastructure as Code (IaC) with Terraform.

## Infrastructure Overview
In this project, Terraform is used to create a single AWS EC2 instance with the following characteristics:
- Ubuntu Server 24.04 LTS (HVM).
- **t2.nano** instance type (eligible for AWS free tier).
- Default VPC and subnet.

### Architecture Diagram

<div align="center">
  <img width="621" height="281" alt="web-server-ec2 drawio" src="https://github.com/user-attachments/assets/737182ab-6cfb-409b-b2eb-bfc32180d15a" />
</div>

### Terraform Dependency Graph

<div align="center">
  <img width="1523" height="539" alt="graphviz" src="https://github.com/user-attachments/assets/e1fe315b-ce27-4750-ad7c-1b80783f84fc" />
</div>

The goal is to get familiar with Terraform configuration files, providers, resources, and basic commands.

## How to Run

**NOTE:** This example will deploy real resources into your AWS account.
Remember to delete created resources to avoid charges on your AWS account.

### Pre-requisites

- Terraform installed (version v1.14.3 or higher recommended).
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

Check the **Outputs** in the terminal, for example:
```bash
Outputs:

public_ip = "98.92.151.89"
```

From your browser, enter the Public IP address and port **8080**:
```bash
http://98.92.151.89:8080/
```

You should see the following message:
```bash
Congratulations, the web server is working successfully
```

Clean up when you're done:
```bash
terraform destroy
```

This practice is a foundational step to understand Terraform workflow and AWS resource provisioning.
You can extend this by adding variables, outputs, and more complex resources in future practices.
