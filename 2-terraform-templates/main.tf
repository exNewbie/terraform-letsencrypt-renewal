terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "your-organization"

    workspaces {
      prefix = "your-prefix-"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-2"
  profile = terraform.workspace
}

module "letsencrypt-renewal" {
  source = "./modules/"

  # Module variables
  s3_bucket          = var.s3_bucket
  s3_prefix          = var.s3_prefix
  email              = var.email
  domain             = var.domain
  renewal_period     = var.renewal_period
  dry_run            = var.dry_run
  is_enable_schedule = var.is_enable_schedule
  ssm_key            = var.ssm_key
  ssm_ca1            = var.ssm_ca1
  ssm_ca2            = var.ssm_ca2
  ssm_cert           = var.ssm_cert
}
