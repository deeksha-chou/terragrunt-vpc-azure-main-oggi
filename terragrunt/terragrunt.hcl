# Root Terragrunt configuration

locals {
  region         = "eu-north-1"
  state_bucket   = "terragrunt-vpc-state"       
  dynamodb_table = "terragrunt-locks"           
}

# Define remote backend configuration (applies to all envs via include)
remote_state {
  backend = "s3"
  config = {
    bucket         = local.state_bucket
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    encrypt        = true
    dynamodb_table = local.dynamodb_table
  }
}

# Automatically generate a provider.tf file for each environment
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "${local.region}"
}
EOF
}

