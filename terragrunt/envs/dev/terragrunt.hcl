terraform {
  source = "../../modules/vpc"
}

locals {
  project_name = "decyda"
  environment  = "prod"
  region       = "eu-south-1"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<-EOF
  provider "aws" {
    region = "${local.region}"
  }
  EOF
}

remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

  config = {
    bucket         = "prod-terraform-vpc"          # <<< CHANGE
    key            = "envs/prod/terraform.tfstate" # per-env state key
    region         = local.region
    encrypt        = true
    dynamodb_table = "terraform-locks"             # <<< CHANGE or remove
  }
}

inputs = {
  project_name       = local.project_name
  environment        = local.environment
  vpc_cidr           = "10.1.0.0/16"

  availability_zones = ["eu-south-1a", "eu-south-1b"]

  public_subnet_az1_cidr      = "10.1.1.0/24"
  public_subnet_az2_cidr      = "10.1.2.0/24"
  private_app_subnet_az1_cidr = "10.1.11.0/24"
  private_app_subnet_az2_cidr = "10.1.12.0/24"
  private_data_subnet_az1_cidr = "10.1.21.0/24"
  private_data_subnet_az2_cidr = "10.1.22.0/24"
}
