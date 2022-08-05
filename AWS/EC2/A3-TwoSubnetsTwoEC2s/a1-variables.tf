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

variable "apig_subnet_cidr_block" {
  type    = string
  default = "192.168.100.128/25"
}

# variable "availability_zone_1" {
#   type    = string
#   default = "us-west-2a"
# }

# variable "availability_zone_2" {
#   type    = string
#   default = "us-west-2b"
# }

# Example of a list variable
variable "availability_zones" {
  default = ["us-west-2a", "us-west-2b"]
}

# Example of an integer variable
variable "instance_count" {
  default = 2
}

# variable "ami" {
#   type    = string
#   default = "ami-0528a5175983e7f28"
# }

# Example of a map variable
variable "ami_ids" {
  default = {
    "us-west-2" = "ami-0fb83677"
    "us-east-1" = "ami-97785bed"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
