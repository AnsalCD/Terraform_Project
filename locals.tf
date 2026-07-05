locals {
  bucket_name = "${var.channel_name}-${var.environment}-bucket"
  vpc_name = "${var.environment}-VPC"
}