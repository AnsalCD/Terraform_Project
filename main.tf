resource "aws_s3_bucket" "compliance_bucket" {
  bucket = "compliance-bucket-dev-123456789012"

  tags = var.tags

  # Lifecycle Rule: Validate bucket has required tags after creation
  # This ensures compliance with organizational tagging policies
  lifecycle {
    postcondition {
      condition     = contains(keys(var.tags), "Compliance")
      error_message = "ERROR: Bucket must have a 'Compliance' tag for audit purposes!"
    }

    postcondition {
      condition     = contains(keys(self.tags), "Environment")
      error_message = "ERROR: Bucket must have an 'Environment' tag!"
    }
  }
}