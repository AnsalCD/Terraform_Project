  terraform{
  
  backend "s3" {
    bucket       = "luffy-one-piece-terraform-state"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
  }