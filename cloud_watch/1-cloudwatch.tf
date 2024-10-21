resource "aws_cloudwatch_log_group" "log_groups" {
  name = var.aws_cloudwatch_log_group_name
  retention_in_days = var.retention_in_days 

  tags = merge(
    { Name = "${var.env}-${var.aws_cloudwatch_log_group_name}-${var.aws_cloudwatch_log_group_stream_name}-cloudwatch" },
    { Service = "CloudWatch" }, 
    var.tags
  )
}

resource "aws_cloudwatch_log_stream" "log_stream" {
  name = var.aws_cloudwatch_log_group_stream_name
  log_group_name = aws_cloudwatch_log_group.log_groups.name
}