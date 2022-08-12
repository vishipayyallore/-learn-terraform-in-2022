variable "region" {
  type    = string
  default = "us-east-2" # Ohio
}

variable "vpc_cidr_block" {
  type    = string
  default = "192.168.100.0/24"
}

variable "fronentend_subnet_cidr_block" {
  type    = string
  default = "192.168.100.0/25"
}

variable "availability_zone" {
  type    = string
  default = "us-east-2a"
}

variable "ami" {
  type    = string
  default = "ami-0528a5175983e7f28"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
