variable "env" {
  description = "Environment name"
  type        = string
}

variable "aws_cloudwatch_log_group_name" {
  description = "Cloud Watch log group name"
  type = string
}

variable "aws_cloudwatch_log_group_stream_name" {
  description = "Cloud watch group stream name"
  type = string
}

variable "retention_in_days" {
  description = "Specifies the number of days"
  type = number
}

variable "tags" {
  description = "Tag values for CloudWatch"
  type = map(any)
}