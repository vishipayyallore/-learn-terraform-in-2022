terraform {
  required_version = ">= 1.2.6"

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

resource "aws_vpc" "vpc_for_web_servers" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "VPC for Web Servers"
  }
}

resource "aws_subnet" "web_subnets" {
  # Use the count meta-parameter to create multiple copies
  count = 2

  vpc_id = aws_vpc.vpc_for_web_servers.id

  # cidrsubnet function splits a cidr block into subnets
  cidr_block = cidrsubnet(var.vpc_cidr_block, 1, count.index)

  # element retrieves a list element at a given index
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "Frontend Subnet ${count.index + 1}"
  }
}

resource "aws_instance" "web_server" {
  count = var.instance_count

  # lookup returns a map value for a given key
  ami = lookup(var.ami_ids, "us-west-2")

  instance_type = var.instance_type

  # Use the subnet ids as an array and evenly distribute instances
  subnet_id = element(aws_subnet.web_subnets.*.id, count.index % length(aws_subnet.web_subnets.*.id))

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
  }

  tags = {
    Name = "Web Server ${count.index + 1}"
  }

}

################################################################################

################################################################################

# resource "aws_subnet" "frontend_subnet" {
#   vpc_id            = aws_vpc.vpc_for_web_server.id
#   cidr_block        = var.fronentend_subnet_cidr_block
#   availability_zone = var.availability_zone_1

#   tags = {
#     Name = "Frontend Subnet"
#   }
# }

# resource "aws_subnet" "apig_subnet" {
#   vpc_id            = aws_vpc.vpc_for_web_server.id
#   cidr_block        = var.apig_subnet_cidr_block
#   availability_zone = var.availability_zone_2

#   tags = {
#     Name = "API Gateway Subnet"
#   }
# }

