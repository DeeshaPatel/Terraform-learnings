output "s3_bucket_name" {
  description = "Name of the s3 bucket"
  value       = aws_s3_bucket.s3_bucket.bucket
}

output "s3_bucket_arn" {
  description = "ARN of s3 bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "s3_bucket_uri" {
  description = "full URI of s3 bucket"
  value       = "s3://${aws_s3_bucket.s3_bucket.bucket}/"
}