resource "aws_instance" "strapi" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = data.aws_subnet_ids.default.ids[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = templatefile("${path.module}/user_data.tpl", {
    repo_url     = var.repo_url
    app_dir      = var.app_dir
    db_host      = aws_db_instance.postgres.address
    db_name      = var.db_name
    db_user      = var.db_username
    db_password  = var.db_password
    s3_bucket    = aws_s3_bucket.strapi_uploads.bucket
  })

  tags = {
    Name = "strapi-ec2"
  }
}

