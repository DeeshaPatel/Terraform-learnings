resource "aws_codedeploy_app" "code_deploy_application" {
  name             = var.codedeploy_app_name
  compute_platform = var.codedeploy_compute_platform

  tags = merge(
    { Name = "${var.env}-${var.codedeploy_app_name}-code-deploy-app" },
    { Service = "Code deploy app" },
    var.tags
  )
}