terraform {
  backend "s3" {
    bucket = "terraform-state-key20231117084134961500000001"
    key = "Terraform-loop/users/terraform.tfstate"
    region = "us-east-2"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}


provider "aws" {
  region = "us-east-2"
}

variable "iam_users" {
    description = "List of iam users"
    type = list(string)
    default = [ "Abebe","Beqele","Kebede" ]
  
}

resource "aws_iam_user" "target_group_arns" {
    count = length(var.iam_users)
    name = var.iam_users[count.index]
      
}