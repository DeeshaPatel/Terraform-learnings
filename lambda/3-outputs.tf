output "lambda_iam_assume_role_id" {
  value = aws_iam_role.iam_lambda_assume_role.id
}

output "lambda_function_name" {
  value = aws_lambda_function.lambda_function.function_name
}

output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn
}