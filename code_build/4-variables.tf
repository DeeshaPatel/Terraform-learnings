variable "env" {
  description = "Environment name"
  type        = string
}

variable "codebuild_name" {
  description = "Name of the code build project"
  type        = string
}

variable "source_info" {
  description = "The source of the build."
  type = object({
    codebuild_buildspec = string
    repository_type     = string
  })
}

variable "code_build_environment_variables" {
  description = "Code build env variables to use during the execution."
  type = list(object({
    name  = string
    value = string
    type  = optional(string, "PLAINTEXT")
  }))
}

variable "build_environment_type" {
  description = "Type of build environment to use for related builds. Valid values: LINUX_CONTAINER, LINUX_GPU_CONTAINER, WINDOWS_SERVER_2019_CONTAINER, ARM_CONTAINER, LINUX_LAMBDA_CONTAINER, ARM_LAMBDA_CONTAINER"
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "docker_image" {
  description = "Docker image to build project"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}

variable "credential_type" {
  description = "Type of credentials AWS CodeBuild uses to pull images in build. Valid values: CODEBUILD or SERVICE_ROLE."
  type        = string
  default     = "CODEBUILD"
}

variable "compute_type" {
  description = "Information about the compute resources the build project will use."
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "region" {
  description = "region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Tags for IAM role for code build"
  type        = map(any)
}