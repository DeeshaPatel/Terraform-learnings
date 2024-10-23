resource "aws_iam_role" "iam_codebuild_assume_role" {
  name               = "clara-code-build-service-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = [ "codebuild.amazonaws.com" ]
    }

    actions = ["sts:AssumeRole"]
  }
}