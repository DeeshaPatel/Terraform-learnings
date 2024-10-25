output "codedeploy_project_name" {
  description = "Name of the deploy project"
  value       = aws_codedeploy_app.code_deploy_application.name
}

output "code_deploy_group_name" {
  description = "Name of the deploy group"
  value       = aws_codedeploy_deployment_group.code_deploy_group.deployment_group_name
}

output "code_deploy_service_role_id" {
  description = "Service role ARN to add policies"
  value       = aws_iam_role.iam_codedeploy_assume_role.id
}