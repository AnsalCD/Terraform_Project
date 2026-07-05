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

variable "environment"{
  default = "dev"
}

variable "channel_name" {
  default = "lop"
}

variable "region" {
  default = "us-east-1"
}

locals {
  bucket_name = "${var.channel_name}-${var.environment}-${var.region}"
  vpc_name = "${var.environment}-VPC"
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

output "vpc_id" {
  value = aws_vpc.sample.id
}