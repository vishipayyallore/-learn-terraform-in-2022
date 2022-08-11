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

resource "aws_dynamodb_table" "example" {
  name           = var.dynamodb_table_name
  read_capacity  = var.dynamodb_table_read_capacity
  write_capacity = var.dynamodb_table_write_capacity
  hash_key       = var.dynamodb_table_hash_key


  attribute {
    name = "exampleHashKey"
    type = "S"
  }

}

resource "aws_dynamodb_table_item" "example" {
  table_name = aws_dynamodb_table.example.name
  hash_key   = aws_dynamodb_table.example.hash_key

  item = <<ITEM
            {
            "exampleHashKey": {"S": "something"},
            "one": {"N": "11111"},
            "two": {"N": "22222"},
            "three": {"N": "33333"},
            "four": {"N": "44444"}
            }
        ITEM
}
