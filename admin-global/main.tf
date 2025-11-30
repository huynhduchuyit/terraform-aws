################################################################################
# AWS Provider Configuration
################################################################################
provider "aws" {
  region              = var.region
  allowed_account_ids = [var.account_id]
  access_key          = var.access_key
  secret_key          = var.secret_key
}

data "aws_iam_account_alias" "current" {}

################################################################################
# Logs
################################################################################
module "logs" {
  source  = "trussworks/logs/aws"
  version = "18.0.0"

  s3_bucket_name = var.logging_bucket
}

################################################################################
# Config
################################################################################
module "config" {
  source  = "trussworks/config/aws"
  version = "8.1.1"

  config_name        = format("%s-config-%s", data.aws_iam_account_alias.current.account_alias, var.region)
  config_logs_bucket = module.logs.aws_logs_bucket

  check_cloud_trail_encryption          = true
  check_cloud_trail_log_file_validation = true
  check_multi_region_cloud_trail        = true
}
