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
output "all_arns" {
    value = aws_iam_user.example[*].arn
    description = "The ARNs for all users"
}

### Loop with count
# resource "aws_iam_user" "example" {
#     count = length(var.iam_users)
#     name = var.iam_users[count.index]
      
# }

## Loop with foreach
resource "aws_iam_user" "foreach_user" {
    for_each = toset(var.iam_users)
    name = each.value
}