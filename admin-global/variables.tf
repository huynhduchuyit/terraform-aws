variable "account_alias" {
  description = "AWS account alias"
  type        = string
  default     = "huyhuynh"
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
  default     = "897729132192"
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "logging_bucket" {
  description = "S3 bucket for AWS logs"
  type        = string
  default     = "huyhuynh-aws-logs"
}

variable "access_key" {
  description = "AWS access key"
  type        = string
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
}
