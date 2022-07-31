terraform {
  required_version = ">= 1.2.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.24.0"
    }
  }
}

provider "aws" {
  region = var.region # Oregon
}

resource "aws_vpc" "web_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "Web VPC"
  }
}

resource "aws_subnet" "frontend_subnet" {
  vpc_id            = aws_vpc.web_vpc.id
  cidr_block        = var.fronentend_subnet_cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = "web_subnet1"
  }
}


resource "aws_instance" "web_server" {
  ami           = "ami-0528a5175983e7f28"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.frontend_subnet.id
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
  }
  tags = {
    Name = "web_server"
  }
}
