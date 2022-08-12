variable "region" {
  type    = string
  default = "us-east-2" # Ohio
}

variable "network_cidr_block" {
  default = "192.168.100.0/24"
}

variable "availability_zones" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "instance_count" {
  default = 2
}

variable "ami_ids" {
  default = {
    "us-east-2" = "ami-0fb83677"
    "us-east-1" = "ami-97785bed"
  }
}
