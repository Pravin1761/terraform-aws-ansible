provider "aws" {
 region = "us-west-2"
}

resource "aws_instance" "ubuntu" {
 ami          = "ami-0c55b159cbfafe1f0" # replace with your Ubuntu AMI ID
 instance_type = "t2.micro"

 tags = {
   Name = "Ubuntu EC2 Instance"
 }
}

resource "aws_instance" "centos" {
 ami          = "ami-0d5d9d301c853a04a" # replace with your CentOS AMI ID
 instance_type = "t2.micro"

 tags = {
   Name = "CentOS EC2 Instance"
 }
}
