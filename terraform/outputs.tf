output "ec2_public_ip" {
  value = aws_instance.strapi.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.address
}

output "s3_bucket" {
  value = aws_s3_bucket.strapi_uploads.bucket
}

