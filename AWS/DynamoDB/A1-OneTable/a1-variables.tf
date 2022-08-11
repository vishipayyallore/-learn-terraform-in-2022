variable "region" {
  type    = string
  default = "us-west-2" # Oregon
}

variable "dynamodb_table_name" {
  type    = string
  default = "example-name"
}

variable "dynamodb_table_hash_key" {
  type    = string
  default = "exampleHashKey"
}

variable "dynamodb_table_read_capacity" {
  type    = number
  default = 10
}

variable "dynamodb_table_write_capacity" {
  type    = number
  default = 10
}
