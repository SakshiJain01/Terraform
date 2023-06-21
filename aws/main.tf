terraform {
	required_providers {
	aws = {
	source = "hashicorp/aws"
	version = "~> 4.16"
}
}
	required_version = ">= 1.2.0"
}

provider "aws" {
region = "us-east-1"
}

locals {
  instances = {"ec2":"ami-022e1a32d3f742bd8","ec2*1":"ami-053b0d53c279acc90"}
}

resource "aws_instance" "aws_ec2_test" {
  for_each      = local.instances
  ami           = each.value
  instance_type = "t2.micro"
  tags = {
    Name = each.key
  }
}

