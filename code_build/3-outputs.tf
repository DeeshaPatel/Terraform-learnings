output "codebuild_project_name" {
  value = aws_codebuild_project.codebuild_project_template.name
}

output "build_assume_role" {
  value = aws_iam_role.iam_codebuild_assume_role.id
}