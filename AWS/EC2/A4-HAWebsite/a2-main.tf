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

resource "aws_vpc" "vpc_for_web" {
  cidr_block           = var.network_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "VPC for HA Website"
  }
}

resource "aws_subnet" "subnet_for_web" {
  # Use the count meta-parameter to create multiple copies
  count = 2

  vpc_id = aws_vpc.vpc_for_web.id

  # cidrsubnet function splits a cidr block into subnets
  cidr_block = cidrsubnet(var.network_cidr_block, 2, count.index)

  # element retrieves a list element at a given index
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "Subnet ${count.index + 1} for Website"
  }

}

resource "aws_instance" "ec2_for_web" {

  count = var.instance_count
  # lookup returns a map value for a given key

  ami = lookup(var.ami_ids, "us-east-2")

  instance_type = "t2.micro"

  # Use the subnet ids as an array and evenly distribute instances
  subnet_id = element(aws_subnet.subnet_for_web.*.id, count.index % length(aws_subnet.subnet_for_web.*.id))

  # Use instance user_data to serve the custom website
  user_data = file("user_data.sh")

  # Attach the web server security group
  vpc_security_group_ids = ["${aws_security_group.sg_for_web.id}"]

  tags = {
    Name = "Web Server ${count.index + 1}"
  }

}
