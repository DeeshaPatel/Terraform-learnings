resource "aws_iam_role" "iam_codebuild_assume_role" {
  name               = "clara-code-build-service-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = merge(
    { Name = "${var.env}-${var.codebuild_name}-iam-role" },
    { Service = "IAM Role" },
    var.tags
  )
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}