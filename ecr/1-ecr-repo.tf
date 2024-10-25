resource "aws_ecr_repository" "ecr_repository" {
  name                 = "clara-${lower(var.tags["Environment"])}-${lower(var.env)}/${var.ecr_name}"
  image_tag_mutability = var.mutable_type

  image_scanning_configuration {
    scan_on_push = var.should_scan_on_push
  }

  tags = merge(
    { Name = "${var.env}-${var.ecr_name}-ecr-repository" },
    { Service = "ECR Repository" },
    var.tags
  )
}