variable "region" {
  type        = string
  description = "AWS region where the infrastructure will be deployed"
}

variable "project_name" {
  type        = string
  description = "Name of the project for tagging and identification"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_az1_cidr" {
  type        = string
  description = "CIDR block for public subnet in AZ1"
}

variable "public_subnet_az2_cidr" {
  type        = string
  description = "CIDR block for public subnet in AZ2"
}

variable "private_app_subnet_az1_cidr" {
  type        = string
  description = "CIDR block for private application subnet in AZ1"
}

variable "private_app_subnet_az2_cidr" {
  type        = string
  description = "CIDR block for private application subnet in AZ2"
}

variable "private_data_subnet_az1_cidr" {
  type        = string
  description = "CIDR block for private data subnet in AZ1"
}

variable "private_data_subnet_az2_cidr" {
  type        = string
  description = "CIDR block for private data subnet in AZ2"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., dev or prod)"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  description = "List of availability zones to be used"
}
