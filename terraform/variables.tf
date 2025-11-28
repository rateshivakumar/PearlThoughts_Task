variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "key_name" {
  description = "Existing AWS key pair name for EC2 SSH access"
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "repo_url" {
  description = "The Strapi application repo to clone on the EC2 (use a starter/app repo)."
  type    = string
  default = "https://github.com/strapi/strapi-starter-blog.git"
}

variable "app_dir" {
  description = "Path inside the cloned repo where backend lives (if needed)."
  type    = string
  default = "backend"
}

variable "db_username" {
  type    = string
  default = "strapi_user"
}

variable "db_password" {
  type    = string
  sensitive = true
}

variable "db_name" {
  type    = string
  default = "strapi_db"
}

variable "allowed_cidr" {
  description = "CIDR allowed to access instance SSH/HTTP. Use 0.0.0.0/0 for demos (not recommended)."
  type    = string
  default = "0.0.0.0/0"
}

