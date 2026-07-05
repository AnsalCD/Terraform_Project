terraform {
  backend "s3" {
    bucket       = "luffy-one-piece-terraform-state"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create S3 Bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "luffy-one-piece-bucket-001"

  tags = {
    Name        = "My bucket 2.0"
    Environment = "Dev"
  }
}