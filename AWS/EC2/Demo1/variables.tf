variable "region" {
  type    = string
  default = "us-west-2" # Oregon
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
  default = "us-west-2a"
}
