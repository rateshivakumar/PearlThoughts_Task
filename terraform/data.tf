# Use default VPC
data "aws_vpc" "default" {
  default = true
}

# get a subnet in default vpc in the region
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

# Ubuntu 22.04 AMI (Canonical owner 099720109477)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

