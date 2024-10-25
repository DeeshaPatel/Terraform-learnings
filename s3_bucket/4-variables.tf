variable "env" {
  description = "Environment name"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the bucket goes here"
  type        = string
}

variable "create_s3_object" {
  description = "Want to create s3 object or not? Default is false"
  type        = bool
  default     = false
}

variable "file_source" {
  description = "Source with full path of the file source in local directory"
  type        = string
  default     = ""
}

variable "file_key" {
  description = "Name of the file to upload in s3 bucket."
  type        = string
  default     = ""
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Tags for S3 Bucket"
  type        = map(any)
}