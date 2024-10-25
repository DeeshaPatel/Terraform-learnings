variable "env" {
  description = "Environment Name"
  type        = string
}

variable "ecr_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "mutable_type" {
  description = "Tag mutable settings. Valid values are MUTABLE or IMMUTABLE. Default set to MUTABLE."
  type        = string
  default     = "MUTABLE"
}

variable "should_scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository or not. Default is false"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for ECR Repository"
  type        = map(any)
}