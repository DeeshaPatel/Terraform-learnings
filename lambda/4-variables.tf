variable "env" {
  description = "Environment Name"
  type        = string
}

variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "Runtime version of Python."
  type        = string
  default     = "python3.12"
}

variable "file_name" {
  description = "Name of the zip file that contains lambda function."
  type        = string
  default = "deploy.zip"
}

variable "handler" {
  description = "Handler is a name of the file following by period and function entry point."
  type        = string
  default     = "deploy.lambda_handler"
}

variable "should_publish" {
  description = "Whether to publish creation/change as new Lambda Function Version"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for IAM role for Lambda"
  type        = map(any)
}