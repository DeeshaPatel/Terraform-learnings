terraform {
    source = "git::git@github.com:DeeshaPatel/Terragrunt-example-module.git//VPC"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    aws_region = "ca-central-1"
    environment = ""
    name = "dev"
    vpc_cidr = "10.0.0.0/16"
    public_route = "0.0.0.0/0"
}