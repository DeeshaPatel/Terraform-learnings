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
  # both of keys can be get from signing into AWS -> IAM role -> add user and follow the steps 
  # access_key = GET FROM AWS BUT WRITING ACCESS KEY DIRECTLY IS NOT A GOOD IDEA
  # secret_key = GET FROM AWS BUT WRITING ACCESS KEY DIRECTLY IS NOT A GOOD IDEA 
  alias = "canada" # To differentiate two different configuration 
}

resource "aws_security_group" "security_group_test" {
  provider    = aws.canada
  name        = "allow_ssh"
  description = "Allow SSH inbound and all outbound"

  tags = {
    Name = "allow_SSH"
  }
} 

resource "aws_vpc_security_group_ingress_rule" "ingress_rule1" {
  cidr_ipv4         = aws_vpc.main.cidr_block
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  security_group_id = aws_security_group.security_group_test.id
  description       = "Ingress rule for accepting just ssh traffic"
}

resource "aws_vpc_security_group_egress_rule" "egress_rule1" {
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  security_group_id = aws_security_group.security_group_test.id
  description       = "Egress rule for accepting all traffic"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}