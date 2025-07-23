terraform {
  backend "s3" {
    bucket         = "terraformstate"
    key            = "eks/dev/terraform.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}



