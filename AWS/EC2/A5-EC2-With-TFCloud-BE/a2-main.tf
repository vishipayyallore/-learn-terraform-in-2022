terraform {
  required_version = ">= 1.2.6"

  cloud {
    organization = "swamy-the-tf-learner"

    workspaces {
      name = "First-Simple-Work-Space"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.24.0"
    }
  }

}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc_for_web_server" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "VPC for Web Server"
  }
}

resource "aws_subnet" "frontend_subnet" {
  vpc_id            = aws_vpc.vpc_for_web_server.id
  cidr_block        = var.fronentend_subnet_cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = "Frontend Subnet"
  }
}


resource "aws_instance" "web_server" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.frontend_subnet.id

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
  }

  tags = {
    Name = "Web Server"
  }

}
