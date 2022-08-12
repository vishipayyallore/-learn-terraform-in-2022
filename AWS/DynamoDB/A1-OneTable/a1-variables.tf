variable "region" {
  type    = string
  default = "us-east-2" # Ohio
}

variable "dynamodb_table_name" {
  type    = string
  default = "employees"
}

variable "dynamodb_table_hash_key" {
  type    = string
  default = "employeeId"
}

variable "dynamodb_table_read_capacity" {
  type    = number
  default = 10
}

variable "dynamodb_table_write_capacity" {
  type    = number
  default = 10
}
