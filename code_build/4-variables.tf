variable "codebuild_name" {
  type = string
  description = "name of the code build project"
}

variable "source_info" {
  type = object({
    codebuild_buildspec = string
    repository_type = string 
  })
}

variable "code_build_environment_variables" {
  type = list(object({
    name = string
    value = string
    type = optional(string, "PLAINTEXT")
  }))
}

variable "codebuild_buildspec" {
  type = string
  description = "location of build specification file"
}

variable "bucket_zip_file" {
  type = string
  description = "location of zip file"
}

variable "build_environment_type" {
  type = string
  description = "Type of build environment to use for related builds. Valid values: LINUX_CONTAINER, LINUX_GPU_CONTAINER, WINDOWS_SERVER_2019_CONTAINER, ARM_CONTAINER, LINUX_LAMBDA_CONTAINER, ARM_LAMBDA_CONTAINER"
  default = "LINUX_CONTAINER"
}

variable "docker_image" {
  type = string
  description = "Docker image to build project"
  default = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}

variable "credential_type" {
  type = string
  description = "Type of credentials AWS CodeBuild uses to pull images in build. Valid values: CODEBUILD or SERVICE_ROLE."
  default = "CODEBUILD"
}

variable "compute_type" {
  type = string
  description = "Information about the compute resources the build project will use."
  default = "BUILD_GENERAL1_SMALL"
}

variable "region" {
  type = string
  description = "region"
  default = "us-east-1"
}