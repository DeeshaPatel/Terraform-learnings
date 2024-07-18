terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = "ca-central-1"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ca-central-1"
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "subnet3" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.3.0/24"
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  for_each = var.subnets
  route {
    cidr_block = each.value
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

resource "aws_route_table_association" "association" {
  route_table_id = aws_route_table.route_table.id
  subnet_id = aws_subnet.subnet1.id  
}