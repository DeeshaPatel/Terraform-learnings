resource "aws_iam_role" "iam_codedeploy_assume_role" {
  name               = "clara-code-deploy-service-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = merge(
    { Name = "${var.env}-${var.codedeploy_app_name}-iam-role" },
    { Service = "IAM Role" },
    var.tags
  )
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}