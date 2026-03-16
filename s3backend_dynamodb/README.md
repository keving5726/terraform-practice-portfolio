# Terraform Practice: S3 Backend with DynamoDB

## Objective

The objective of this practice is to:
- Understand how to configure and test a remote backend using S3 and DynamoDB in Terraform.
- Validate state locking functionality to prevent concurrent state modifications.
- Explore workspace management for environment separation.

How the S3 backend with DynamoDB works:
1. Access is controlled by a least-privileged IAM role that authorized users or services assume to gain temporary permissions for reading/writing state files and using the encryption keys.
2. DynamoDB provides a locking mechanism to coordinate access and prevent simultaneous state changes, maintaining integrity and avoiding conflicts.
3. Your Terraform state files are securely stored in an S3 bucket with server-side encryption using AWS KMS, ensuring data confidentiality at rest.

<div align="center">
  <img width="669" height="319" alt="S3 backend moduel drawio" src="https://github.com/user-attachments/assets/bfd172fd-a556-48e4-9e7c-16a613a7e543" />
</div>

This practice is focused on testing the S3 backend configuration with DynamoDB for state locking, in order to help you begin testing Terraform S3 backends effectively.

## Infrastructure Overview

The infrastructure consists of the following key components:
- 1 KMS key.
- 1 S3 bucket.
- 1 DynamoDB table.
- 1 IAM role.
- 1 IAM policy.
- 1 resource group.
- 2 EC2 instances: **t4g.micro** (eligible for AWS free tier).
