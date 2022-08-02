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
  # Configuration options
  region = var.region
}

resource "aws_vpc" "vpc_for_web" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "VPC for Web"
  }
}
