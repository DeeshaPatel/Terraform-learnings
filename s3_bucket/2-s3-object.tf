resource "aws_s3_object" "s3_object" {
  count = var.create_s3_object ? 1 : 0

  bucket = aws_s3_bucket.s3_bucket.bucket
  key    = var.file_key
  source = var.file_source

  tags = merge(
    { Name    = "${var.env}-${var.s3_bucket_name}-S3-object" },
    { Service = "S3 object" },
    var.tags
  )
}