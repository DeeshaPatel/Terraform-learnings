resource "aws_iam_role_policy" "role_policy" {
  name   = var.iam_role_policy_name
  role   = var.iam_role_id
  policy = data.aws_iam_policy_document.policy.json
}

data "aws_iam_policy_document" "policy" {
  dynamic "statement" {
    for_each = var.statement
    content {
      effect    = "Allow"
      actions   = statement.value.actions
      resources = statement.value.resources
    }
  }
}
