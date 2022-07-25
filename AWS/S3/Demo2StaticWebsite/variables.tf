# required for AWS
variable "access_key" {}

variable "secret_key" {}

variable "region" {
  default = "us-east-1"
}

variable "root_domain" {
  default = "s3-bucket-dev-001"
}

variable "blog_bucket_subdomain" {
  default = "blog"
}

