terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "instance1" {
  ami               = "ami-0c4596ce1e7ae3e68"
  instance_type     = "t2.micro"
  availability_zone = "ca-central-1"

  tags = {
    Name = "WithSecurityGroup"
  }
}

resource "aws_security_group" "security_group_main" {
  name        = "allow_tls"
  description = "Allow TLS inbound and all outbound traffic"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rule1" {
  security_group_id = aws_security_group.security_group_main.id
  ip_protocol       = "tcp"
  cidr_ipv4         = aws_vpc.main.cidr_block
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  security_group_id = aws_security_group.security_group_main.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
