resource "aws_codedeploy_deployment_group" "code_deploy_group" {
  app_name               = aws_codedeploy_app.code_deploy_application.name
  service_role_arn       = aws_iam_role.iam_codedeploy_assume_role.arn
  deployment_group_name  = var.code_deploy_group_deployment_group_name
  deployment_config_name = var.default_deployment_config_name

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }
}