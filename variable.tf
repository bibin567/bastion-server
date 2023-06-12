variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_region" {
  default = "us-east-1"
}


variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "myvpc"
}

variable "private_subnet_1_cidr_block" {
  description = "CIDR block for private subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_2_cidr_block" {
  description = "CIDR block for private subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "public_subnet_name" {
  description = "Name for the public subnet"
  type        = string
  default     = "public-subnet"
}

variable "private1_subnet_name" {
  description = "Name for private subnet 1"
  type        = string
  default     = "private-subnet-1"
}

variable "private2_subnet_name" {
  description = "Name for private subnet 2"
  type        = string
  default     = "private-subnet-2"
}

variable "sg1_name" {
  description = "Name for security group 1"
  type        = string
  default     = "public-sg"
}

variable "sg2_name" {
  description = "Name for security group 2"
  type        = string
  default     = "private-sg"
}

variable "trusted_ip_address" {
  description = "Trusted IP address for SSH access"
  type        = string
  default     = "myip/32" # Replace with your trusted IP address
}

variable "bastion_sg_cidr" {
  description = "CIDR block for allowing SSH access to the bastion host"
  type        = string
  default     = "myip/32" # Replace with the IP address range allowed to access the bastion host
}

variable "ami_name" {
  description = "Name of the AMI to use for EC2 instances"
  type        = string
  default     = "ami-04a0ae173da5807d3" # Replace with the desired AMI ID
}

variable "instance1_name" {
  description = "Name for the bastion instance"
  type        = string
  default     = "bastion-instance"
}

variable "instance2_name" {
  description = "Name for the private instance"
  type        = string
  default     = "private-instance"
}


