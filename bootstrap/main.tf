################################################################################
# AWS Provider Configuration
################################################################################
provider "aws" {
  region              = var.region
  allowed_account_ids = [var.account_id]
  access_key          = var.access_key
  secret_key          = var.secret_key
}

################################################################################
# Bootstrap
################################################################################
module "bootstrap" {
  source  = "trussworks/bootstrap/aws"
  version = "7.0.0"

  region        = var.region
  account_alias = var.account_alias
}
