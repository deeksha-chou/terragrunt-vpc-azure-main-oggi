plugin "aws" {
  enabled = true
  version = "0.15.1"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

# You can optionally specify AWS region
config {
  aws_region = "eu-north-1"
}
