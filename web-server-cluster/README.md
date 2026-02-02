# Terraform Practice: Web Server Cluster using AWS

## Objective
Automate the provisioning and management of a scalable and highly available infrastructure on AWS to host a web server cluster.
Using Terraform, the project deploys EC2 instances managed by Auto Scaling Groups (ASG) to ensure dynamic scalability, alongside an Application Load Balancer (ALB) that efficiently distributes traffic and enhances service availability.

This project aims to enable Infrastructure as Code (IaC) using Terraform, allowing reproducible deployments, version control, and simplified maintenance of the web architecture on AWS.

## Infrastructure Overview
In this project, Terraform is used to create a web server cluster with the following characteristics:
- Ubuntu Server 24.04 LTS (HVM).
- **t2.nano** instance type (eligible for AWS free tier).
- Default VPC and subnets.
- Application Load Balancing (ALB).
- Auto Scaling Group (ASG).

### Architecture Diagram

<div align="center">
  <img width="637" height="681" alt="web-server-cluster drawio" src="https://github.com/user-attachments/assets/34a07ff3-1f04-4895-9774-30d77ff85a84" />
</div>

### Terraform Dependency Graph

<div align="center">
  <img width="2265" height="1019" alt="graphviz" src="https://github.com/user-attachments/assets/d0df6496-7fc8-4dbe-b0d9-0c0e46d22571" />
</div>

The goal is to get familiar with Terraform configuration files, providers, resources, and basic commands.

## How to Run

**NOTE:** This example will deploy real resources into your AWS account.
Remember to delete created resources to avoid charges on your AWS account.

### Pre-requisites

- Terraform installed (version v1.14.4 or higher recommended).
- AWS CLI configured with your credentials and default region.
- An AWS account with permissions to create EC2 instances, Auto Scaling Group and Application Load Balancing.

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

alb_dns_name = "web-server-lb-908363196.us-east-1.elb.amazonaws.com"
```

From your browser, enter the DNS name:
```bash
http://web-server-lb-908363196.us-east-1.elb.amazonaws.com
```

You should see the following message:
```bash
Congratulations, the web server is working successfully
```

You can take a look at all the resources created using the AWS Management Console.

Clean up when you're done:
```bash
terraform destroy
```

This practice is a foundational step to understand Terraform workflow and AWS resource provisioning.
You can extend this by adding variables, outputs, and more complex resources in future practices.
