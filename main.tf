provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "target_group_arns" {
    count = 3
    name = "test-user${count.index}"
  
}