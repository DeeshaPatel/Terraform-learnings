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

resource "aws_vpc" "vpc_test" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_test.id
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc_test.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_route_table" "route_without_firewall" {
  vpc_id = aws_vpc.vpc_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

# Subnet route table
resource "aws_route_table_association" "association" {
  route_table_id = aws_route_table.route_without_firewall.id
  subnet_id = aws_subnet.public.id
}

resource "aws_instance" "instance" {
  ami           = "ami-0c4596ce1e7ae3e68"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id

}
