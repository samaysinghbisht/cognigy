variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  default     = "samay-aws"
}

variable "project_name" {
  description = "Name of resources in AWS"
  default     = "cognigy"
}

variable "availability_zones" {
  description = "Name of resources in AWS"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "cluster_name" {
  default     = "cognigy"
  type        = string
  description = "AWS EKS CLuster Name"
  nullable    = false
}