# resource "aws_codedeploy_deployment_config" "custom_deploy_config" {
#   deployment_config_name = var.custom_deployment_config_name.name
#   compute_platform = var.custom_deployment_config_name.platform

#   minimum_healthy_hosts {
#     type = var.custom_deployment_config_information.minimum_healthy_hosts.type
#     value = var.custom_deployment_config_information.minimum_healthy_hosts.value
#   }
# }