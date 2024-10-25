resource "aws_iam_role" "iam_lambda_assume_role" {
  name               = "clara-lambda-function-service-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = merge(
    { Name = "${var.env}-${var.function_name}-iam-role" },
    { Service = "IAM Role" },
    var.tags
  )
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}