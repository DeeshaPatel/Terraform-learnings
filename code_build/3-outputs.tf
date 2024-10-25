output "codebuild_project_name" {
  description = "Name of the code build project"
  value       = aws_codebuild_project.codebuild_project_template.name
}

output "build_assume_role" {
  description = "Id of the IAM assume role for code build"
  value       = aws_iam_role.iam_codebuild_assume_role.id
}

output "codebuild_project_arn" {
  description = "Arn of code build project"
  value       = aws_codebuild_project.codebuild_project_template.arn
}