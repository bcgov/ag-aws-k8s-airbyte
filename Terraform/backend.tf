terraform {
  backend "s3" {
    bucket         = "f4cd18-${var.environment}-terraformstate"
    key            = "eks/${var.environment}/terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = "terraform-lock-${var.environment}"
    encrypt        = true
  }
}
