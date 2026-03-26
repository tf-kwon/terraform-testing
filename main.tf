terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_ami" "default" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


resource "aws_instance" "default" {
  ami           = data.aws_ami.default.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
