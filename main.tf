terraform {
  required_version = ">= 0.12.26"
}

provider "aws" {
  region = "us-east-2"
}

# resource "aws_iam_user" "test_user" {
#   name = "test-user"
# }