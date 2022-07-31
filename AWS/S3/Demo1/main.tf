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

resource "aws_s3_bucket" "blog" {
  bucket = "${var.blog_bucket_subdomain}.${var.root_domain}"
}

resource "aws_s3_bucket_acl" "blog_bucket_acl" {
  bucket = aws_s3_bucket.blog.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "read_access_policy" {
  bucket = aws_s3_bucket.blog.id
  policy = <<POLICY
          {
              "Version": "2012-10-17",
              "Statement": [
                  {
                      "Sid": "PublicReadGetObject",
                      "Effect": "Allow",
                      "Principal": "*",
                      "Action": [
                          "s3:GetObject"
                      ],
                      "Resource": [
                          "arn:aws:s3:::${aws_s3_bucket.blog.id}/*"
                      ]
                  }
              ]
          }
POLICY
}
