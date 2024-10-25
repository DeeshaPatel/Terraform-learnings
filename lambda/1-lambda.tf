resource "aws_lambda_function" "lambda_function" {
  function_name = var.function_name
  filename      = var.file_name
  role          = aws_iam_role.iam_lambda_assume_role.arn
  runtime       = var.runtime
  handler       = var.handler
  publish       = var.should_publish

  tags = merge(
    { Name = "${var.env}-${var.function_name}-lambda-function" },
    { Service = "Lambda Function" },
    var.tags
  )
}