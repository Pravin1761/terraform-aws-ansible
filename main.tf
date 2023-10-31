# versions.tf
terraform {
 required_version = ">= 1.0.0"
 required_providers {
   aws = {
     source = "hashicorp/aws"
     version = ">= 4.0"
   }
 }
}

# variables.tf
variable "region" {
 type       = string
 default    = "eu-west-1"
 description = "AWS Region"
}
variable "instance_type" {
 type       = string
 default    = "t2.micro"
 description = "EC2 Instance Type"
}
variable "ami_id" {
 type       = string
 description = "AMI ID"
}

# main.tf
provider "aws" {
 region = var.region
}

resource "aws_instance" "example" {
 ami          = var.ami_id
 instance_type = var.instance_type
}
