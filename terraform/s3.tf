resource "aws_s3_bucket" "strapi_uploads" {
  bucket = "strapi-uploads-${random_id.s3_suffix.hex}"
  acl    = "private"

  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "random_id" "s3_suffix" {
  byte_length = 4
}

