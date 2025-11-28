# Role for EC2 to access S3
resource "aws_iam_role" "ec2_role" {
  name = "strapi-ec2-role"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# Inline policy to allow S3 access (adjust bucket name policy later)
resource "aws_iam_policy" "s3_access_policy" {
  name        = "strapi-ec2-s3-access"
  description = "Allow Strapi to access S3 bucket"
  policy      = data.aws_iam_policy_document.s3_policy_doc.json
}

data "aws_iam_policy_document" "s3_policy_doc" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:GetBucketLocation"
    ]
    resources = [
      aws_s3_bucket.strapi_uploads.arn,
      "${aws_s3_bucket.strapi_uploads.arn}/*"
    ]
  }
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "strapi-ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

