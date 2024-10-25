variable "env" {
  description = "Environment Name"
  type        = string
}

variable "codedeploy_compute_platform" {
  description = "Type can be [Lambda, Server, ECS]"
  type        = string
}

variable "codedeploy_app_name" {
  description = "name of the code deploy project"
  type        = string
}

variable "code_deploy_group_deployment_group_name" {
  description = "Name of the deployment group"
  type        = string
}

variable "want_new_code_deploy_deployment_config" {
  description = "Do you want to create a new deployment config?"
  type        = bool
  default     = false
}

variable "default_deployment_config_name" {
  description = "One from the list of default deployment configurations."
  type        = string
}

# KEEPING IT ON HOLD
# variable "custom_deployment_config_information" {
#   description = {
#     name = "Name of the deployment config"
#     platform = "Compute platform. Can be Server, Lambda, ECS."
#     minimum_healthy_hosts = "Object required when platform is compute. It accepts type and value"
#   }
#   type = object({
#     name = optional(string, "")
#     platform = optional(string, "Server") 
#     minimum_healthy_hosts = optional(object({
#       type = optional(string, "")
#       value = optional(number, ) 
#     }), "")
#   })
# }

variable "region" {
  description = "region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Tags for Code deploy app"
  type        = map(any)
}
