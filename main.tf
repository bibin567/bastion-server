resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.private_subnet_1_cidr_block
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = false
  tags = {
    Name = var.private1_subnet_name
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.private_subnet_2_cidr_block
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = false
  tags = {
    Name = var.private2_subnet_name
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_security_group" "public_ec2" {
  name        = "public_ec2"
  description = "Security group for public EC2 instance"
  vpc_id      = aws_vpc.example.id
  tags = {
    Name = var.sg1_name
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.trusted_ip_address]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "bastion_ip" {
  domain = "vpc"
  instance = aws_instance.bastion.id
}

resource "aws_security_group" "private_ec2" {
  name        = "private_ec2"
  description = "Security group for private EC2 instance"
  vpc_id      = aws_vpc.example.id

  tags = {
    Name = var.sg2_name
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.bastion_sg_cidr]
  }
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "Project VPC IG"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_key_pair" "key" {
  key_name   = "awskey"
  public_key = "ssh-ed25519 xxx bibinjoy2255@gmail.com"
}

resource "aws_instance" "bastion" {
  ami                         = var.ami_name
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public_ec2.id]
  tags = {
    Name = var.instance1_name
  }
}

resource "aws_instance" "private" {
  ami                    = var.ami_name
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key.key_name
  subnet_id              = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.private_ec2.id]
  tags = {
    Name = var.instance2_name
  }
}

output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}

output "private_ip" {
  value = aws_instance.private.private_ip
}
