```markdown
# Terraform AWS VPC Setup

This repository contains Terraform code to set up a Virtual Private Cloud (VPC) in AWS. The VPC includes public and private subnets, security groups, an internet gateway, and EC2 instances.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
  - [Main Terraform Files](#main-terraform-files)
  - [Variables](#variables)
  - [Provider](#provider)
- [Usage](#usage)
- [Cleaning Up](#cleaning-up)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Prerequisites

Before you can use this Terraform code, make sure you have the following:

- AWS account credentials with appropriate permissions
- Terraform installed on your local machine

## Getting Started

Follow the steps below to set up the AWS VPC using Terraform:

1. Clone this repository to your local machine.

2. Modify the `variables.tf` file to customize the VPC settings according to your requirements. You can change the CIDR blocks, subnet names, security group names, and other variables as needed.

3. Run the following command to initialize the Terraform configuration:

```
terraform init
```

4. Run the following command to see the execution plan and ensure everything is configured correctly:

```
terraform plan
```

5. Run the following command to create the AWS resources based on the Terraform code. Confirm the changes by typing "yes" when prompted:

```
terraform apply
```

6. Wait for Terraform to provision the resources. Once completed, you will see the output with the public IP address of the bastion instance.

7. Access the bastion instance by SSH using the public IP address provided in the output.

## Configuration

The Terraform configuration consists of several files that define the AWS VPC infrastructure.

### Main Terraform Files

- **main.tf**: This file defines the AWS resources such as VPC, subnets, security groups, internet gateway, route table, route table association, key pair, and EC2 instances.

### Variables

- **variables.tf**: This file defines the input variables used in the Terraform configuration. You can modify these variables to customize the VPC setup according to your needs. It includes variables for CIDR blocks, subnet names, security group names, trusted IP address, bastion security group CIDR block, AMI name, and instance names.

### Provider

- **provider.tf**: This file specifies the AWS provider and the AWS region to use for the VPC setup.

## Usage

Follow the steps in the [Getting Started](#getting-started) section to set up the AWS VPC using Terraform. Customize the variables in the `variables.tf` file to match your requirements.

## Cleaning Up

To clean up and destroy the AWS resources created by Terraform, run the following command:

```
terraform destroy
```

Confirm the destruction by typing "yes" when prompted.

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Contributions are welcome!

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

This project was inspired by the need to automate the setup of AWS VPC infrastructure using Terraform. We would like to acknowledge the contributions of the open-source community and the developers behind Terraform and AWS.
```
