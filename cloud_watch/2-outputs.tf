output "aws_ecs_group_name" {
  value = aws_cloudwatch_log_group.log_groups.name
}