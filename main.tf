provider "aws" {
  region = "us-east-1"  # Adjust your region accordingly
}

resource "aws_iam_user" "terratest_user1" {
  name = "terratest-user1"
}

resource "aws_iam_user" "terratest_user2" {
  name = "terratest-user2"
}

output "iam_user1_name" {
  value = aws_iam_user.terratest_user1.name
}

output "iam_user2_name" {
  value = aws_iam_user.terratest_user2.name
}
