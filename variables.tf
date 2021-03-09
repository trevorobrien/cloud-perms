variable "region" {
  description = "The default AWS Region"
  default     = "eu-central-1"
}

variable "environment" {
  description = "The environment of the application."
  default     = "dev"
}

variable "team" {
  description = "Team name"
  default     = "panem"
}

variable "project" {
  description = "The name of the project"
  default     = "project-cloud"
}

variable "s3_bucket_frontend_id" {
  description = "The ID of the frontend deployment bucket"
}

variable "origin_access_identity_iam_arn" {
  description = "The IAM ARN of the CloudFront Origin access identity"
}

