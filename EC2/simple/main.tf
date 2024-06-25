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

resource "aws_instance" "terraform-ec2" {
  ami           = "ami-0c4596ce1e7ae3e68"
  instance_type = "t2.micro"

  tags = {
    Name = "instace"
  }

}
