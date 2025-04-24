provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

resource "aws_iam_user" "test_user1" {
  name = "test-user1"
}
resource "aws_iam_user" "test_user2" {
  name = "test-user2"
}
