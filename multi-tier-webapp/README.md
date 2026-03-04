# Terraform Practice: Multi Tier Web Application in AWS

## Objective
To design and deploy a highly available, scalable multi-tiered web application in AWS using Terraform.
Multi-tier simply refers to a software system that is divided into logical layers, like a cake, for example:

<div align="center">
  <img width="390" height="246" alt="Multi-tiered web application drawio" src="https://github.com/user-attachments/assets/1f5591ef-b08d-4d90-be23-91b4cdbbd3ce" />
</div>

This practice aims to demonstrate proficiency in Infrastructure as Code (IaC) by automating the provisioning of network components, load balancers, auto-scaling groups, and backend services to ensure fault tolerance, scalability, and efficient resource management in a cloud environment.

Additionally, the practice will incorporate the use of official AWS Terraform modules and external community modules to learn how to integrate and manage reusable modules effectively, enhancing code modularity and maintainability.

## Infrastructure Overview
In this project, Terraform is used to create a multi-tiered web application in AWS with the following characteristics:
- Networking Module:
    - 1 VPC.
    - 1 route table.
    - 1 Internet gateway.
    - 1 NAT gateway.
    - 3 public subnets for the Application Load Balancer.
    - 3 private subnets for the EC2 instances.
    - 3 private subnets for the RDS instances.
    - 3 security groups (ALB, Web Server and Database).
- Database Module:
    - Engine version: MySQL **8.4.7**.
    - Instance type: **db.t4g.micro** (eligible for AWS free tier).
    - Single-AZ DB instance deployment (1 instance).
- Autoscaling Module:
    - Launch template:
        - AMI: Ubuntu Server 24.04 LTS (HVM), amd64 noble image.
        - Instance type: **t3.micro** (eligible for AWS free tier).
        - User data: Cloud-init configuration.
    - Application Load Balancer (ALB).
    - Auto Scaling Group (ASG).

### Architecture Diagram

<div align="center">
  <img width="1052" height="991" alt="Multi-tiered-web-app drawio" src="https://github.com/user-attachments/assets/c36de098-ac82-4f65-a466-0378f3b5bff5" />
</div>

### Terraform Dependency Graph

<div align="center">
  <img width="711" height="241" alt="Multi-tiered-web-app-dependencies drawio" src="https://github.com/user-attachments/assets/4798cf74-e4f1-41bb-9d05-72d28d3dde3d" />
</div>

## How to Run

**NOTE:** This practice will deploy real resources into your AWS account.
Remember to delete created resources to avoid charges on your AWS account.

### Pre-requisites

- Terraform installed (version v1.14.5 or higher recommended).
- AWS CLI configured with your credentials and default region.
- An AWS account with permissions to create EC2 instances, RDS instances, Auto Scaling group and Application Load Balancing.

### Steps

Initialize Terraform (downloads provider plugins):
```bash
terraform init
```

Preview the infrastructure changes Terraform will apply:
```bash
terraform plan
```

Apply the configuration to create the multi-tiered web application:
```bash
terraform apply
```

Check the **Outputs** in the terminal, for example:
```bash
Outputs:

alb_dns_name = "http://webapp-alb-792144198.us-east-1.elb.amazonaws.com"
```

From your browser, enter the DNS name:
```bash
http://webapp-alb-792144198.us-east-1.elb.amazonaws.com
```

You should see the multi-tiered web application for a social media site geared toward pet owners:

<div align="center">
  <img width="1914" height="1007" alt="pets" src="https://github.com/user-attachments/assets/b22a46f9-4649-4602-a913-8bb0ef46956b" />
</div>

You can take a look at all the resources created using the AWS Management Console.

Clean up when you're done:
```bash
terraform destroy
```

This practice is a foundational step to understand Terraform workflow and AWS resource provisioning.
You can extend this by adding variables, outputs, and more complex resources in future practices.
