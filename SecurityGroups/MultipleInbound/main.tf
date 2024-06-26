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
  alias  = "canada"
}

resource "aws_security_group" "security_group_test" {
  provider    = aws.canada
  name        = "allow HTTP and HTTPS"
  description = "It allows HTTP (80) and HTTPS (443)"
}

resource "aws_vpc_security_group_ingress_rule" "test" {
  for_each          = var.multiple_ports
  from_port         = each.value.from
  to_port           = each.value.to
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.security_group_test.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
}

resource "aws_vpc_security_group_egress_rule" "name" {
  ip_protocol       = "-1"
  security_group_id = aws_security_group.security_group_test.id
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}