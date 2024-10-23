resource "aws_codebuild_project" "codebuild_project_template" {
  name         = var.codebuild_name
  service_role = aws_iam_role.iam_codebuild_assume_role.arn

  environment {
    image                       = var.docker_image
    type                        = var.build_environment_type
    compute_type                = var.compute_type
    image_pull_credentials_type = var.credential_type

    dynamic "environment_variable" {
      for_each = var.code_build_environment_variables 
      content {
        name     = environment_variable.value.name
        value    = environment_variable.value.value
        type     = environment_variable.value.type
      }
    }
  }

  source {
    type      = var.source_info.repository_type
    buildspec = var.source_info.codebuild_buildspec
  }

  artifacts {
    type = "CODEPIPELINE"
  }
}
