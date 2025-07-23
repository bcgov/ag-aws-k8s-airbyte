variable "backend_bucket_name" {
  description = "Name of the S3 bucket for Terraform remote state"
  type        = string
  default = ""
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
}

variable "environment" {
  description = "Environment (e.g. dev, prod)"
  type        = string
}