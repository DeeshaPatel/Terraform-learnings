variable "iam_role_policy_name" {
  description = "Name of the custom policy"
  type        = string
}

variable "iam_role_id" {
  description = "Role id to attached custom policy"
  type        = string
}

variable "statement" {
  description = "Statements in role policy"
  type = list(object({
    actions   = list(string)
    resources = list(string)
  }))
}