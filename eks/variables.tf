variable "region" {
  description = "AWS region"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "eks"
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "prod"
}

variable "access_key" {
  description = "AWS access key"
  type        = string
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
}
