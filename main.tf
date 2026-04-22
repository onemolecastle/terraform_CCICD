provider "aws" {
  region = "eu-west-2"
}


resource "aws_s3_bucket" "example" {
  bucket = "deploymentbucket12654"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "config" {
  bucket = aws_s3_bucket.example.id

  index_document {
    suffix = "index.html"
  }

 }

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
