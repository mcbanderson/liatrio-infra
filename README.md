# liatrio-infra

This repository contains the Terraform code to provision the infrastructure for the Liatrio interview project.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.3.0
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) >= 2.11.25
- AWS credentials with permissions to create the resources defined in the Terraform code

## Resources
The Terraform code in this repository creates the following primary resources:
- VPC
- Subnets
- EKS cluster

For a complete list of resources created, use the `terraform state list` command. Details about a resource can be found using the `terraform state show <ADDRESS>` command.

## Deploying
Deployment happens automatically when commits are merged to the `main` branch. To deploy manually, run the following commands:

```bash
terraform init
terraform apply
```

## Destroying
To destroy the infrastructure, run the following command:

```bash
terraform destroy
```
