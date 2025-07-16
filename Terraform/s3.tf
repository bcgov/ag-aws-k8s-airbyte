resource "aws_s3_bucket" "airbyte" {
  bucket = "airbytes3test"

  # Enable versioning
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "airbytes3test"
    Environment = var.environment
  }
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "airbyte" {
  bucket = aws_s3_bucket.airbyte.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


