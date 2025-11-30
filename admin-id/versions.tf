################################################################################
# Terraform Configuration
################################################################################
terraform {
  required_version = ">= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }

  backend "s3" {
    bucket         = "huyhuynh-tf-state-ap-southeast-1"
    key            = "admin-id/terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    region         = "ap-southeast-1"
    encrypt        = "true"
  }
}
