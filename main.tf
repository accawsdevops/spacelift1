terraform {
  required_version = ">= 0.12.26"
}

provider "aws" {
  region = "us-east-2"
}

# Create IAM Group 1 (group1)
resource "aws_iam_group" "group1" {
  name = "group1"
}

# Create IAM Group 2 (group2)
resource "aws_iam_group" "group2" {
  name = "group2"
}

# Create IAM User 1 (user1)
resource "aws_iam_user" "user1" {
  name = "user1"
}

# Create IAM User 2 (user2)
resource "aws_iam_user" "user2" {
  name = "user2"
}


# Attach AmazonS3ReadOnlyAccess policy to group1
resource "aws_iam_group_policy_attachment" "group1_policy_attachment" {
  group      = aws_iam_group.group1.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# Attach AmazonEC2ReadOnlyAccess policy to group2
resource "aws_iam_group_policy_attachment" "group2_policy_attachment" {
  group      = aws_iam_group.group2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

# Output IAM User and Group Info
output "iam_user1_name" {
  value = aws_iam_user.user1.name
}

output "iam_user2_name" {
  value = aws_iam_user.user2.name
}

output "iam_group1_name" {
  value = aws_iam_group.group1.name
}

output "iam_group2_name" {
  value = aws_iam_group.group2.name
}
