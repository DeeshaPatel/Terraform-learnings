resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name

  tags = merge(
    { Name = "${var.env}-${var.s3_bucket_name}-S3" },
    { Service = "S3" },
    var.tags
  )
}
