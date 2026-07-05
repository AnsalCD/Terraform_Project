variable "environment"{
  type = string
  default = "dev"
}

variable "channel_name" {
  default = "lop"
}

variable "instance_count" {
  description = "Number of EC2 instance created"
  type = number
}

variable "monitoring_enabled" {
  description = "Enabled detailed monitoring for EC2 instances"
  type = bool
  default = true
}

variable "associate_public_ip" {
  description = "Associate public IP address with EC2 instances"
  type = bool
}

variable "cidr_block" {
  description = "CIDR block for the security group ingress rule"
  type        = list(string)
  default     = ["10.0.0.0/8","192.168.0.0/16","172.16.0.0/12"]
}

variable "allowed_vm_types" {
  description = "List of allowed EC2 instance types"
  type        = list(string)
  default     = ["t2.micro", "t2.small", "t2.medium"]
}

variable "allowed_regions" {
  description = "List of allowed AWS regions"
  type        = list(string)
  default     = ["us-east-1", "us-west-2", "eu-west-1"]
}

variable "tags" {
  type        = map(string)
  default     = {
    Environment = "dev"
    Name        = "dev-Instance"
    created_by  = "Terraform"
  }
}

variable "ingress_value" {
  type        = tuple([number, string, number])
  default     = [443, "tcp", 443]
}

variable "config" {
  type = object({
    region          = string,
    monitoring       = bool,
    instance_count    = number
  })
  default = {
    region          = "us-east-1",
    monitoring       = true,
    instance_count    = 1
  }
}

variable "bucket_names" {
  description = "List of S3 bucket names"
  type = list(string)
  default = ["my-unique-bucket-day08-1234561", "my-unique-bucket-day08-1234562"]
}

variable "bucket_names_set" {
  description = "List of S3 bucket names"
  type = set(string)
  default = ["my-unique-bucket-day08-12345610", "my-unique-bucket-day08-12345629"]
}