# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}




# Create S3 Bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = local.bucket_name
  tags = {
    Name        = "${var.environment}-Bucket"
    Environment = var.environment
  }
}

resource "aws_vpc" "sample" {
  cidr_block = "10.0.1.0/24"
  region = var.region
  tags = {
    Environment = var.environment
    Name = local.vpc_name
  }
}
