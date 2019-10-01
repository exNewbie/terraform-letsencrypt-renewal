### Variables ###

variable "s3_bucket" {
  type        = string
  description = "Bucket that stores Lets Encrypt files"
}

variable "s3_prefix" {
  type        = string
  description = "Prefix on S3 bucket"
}

variable "email" {
  type        = string
  description = "Email used to request cert(s)"
}

variable "domain" {
  type        = string
  description = "Domain to obtain a certificate for"
}

variable "renewal_period" {
  type        = number
  description = "How often renewal is triggered"
}

variable "dry_run" {
  type        = string
  description = "Should be true if testing renew or certonly without saving any certificates"
}

variable "is_enable_schedule" {
  type        = bool
  description = "Should be true if testing renew or certonly without saving any certificates"
}

variable "ssm_key" {
  type        = string
  description = "Name of Parameter store that stores Private Key"
}

variable "ssm_cert" {
  type        = string
  description = "Name of Parameter store that stores Certifcate"
}

variable "ssm_ca1" {
  type        = string
  description = "Name of Parameter store that stores part 1 of CA certs"
}

variable "ssm_ca2" {
  type        = string
  description = "Name of Parameter store that stores part 2 of CA certs"
}

### Resources ###

resource "random_pet" "name_suffix" {
  length = 1
}

### Data ###

data "aws_caller_identity" "current" {}
