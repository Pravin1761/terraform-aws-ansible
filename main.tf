# use ubuntu 20 AMI for EC2 instance
data "aws_ami" "ubuntu" {
    most_recent = true
filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*20.04-amd64-server-*"]
    }
filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
owners = ["099720109477"] # Canonical
}
# provision to us-east-2 region
provider "aws" {
  region  = "us-east-2"
}

resource "aws_key_pair" "my_key_pair" {
 key_name  = "app-ssh-key.pem"
 public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCR7WW3YW2xh9wsW4PQH8Xithe4rJ7BmKmfbFdDQ6jbpA8jRQlzujp9S3ykuNyLIismeV+uCdi40Y15qbOauWYad/gmLs7SdMTUxpMA+a0Gx+BZM+reCfzGnCBwz6uole4oQng4FUPpf6yniHomdAq6c3GWnqposQgZnb/+TvwHXvG8qmGi6VwBurOr7jDCpL65JakSAETm5itJiapo77TzswFUxO3wDZ2Clty7sq2cyXPkMTTsgqwRIketb/x4XVx9q7G9/JibGcHC1JsB31YSzaWt+QlI42bb9CbS+1tK7/FmjRgOedVLszvM9zu0Jiy4+ejtqvVcaJV1ehcRw+IB rsa-key-20231101"
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.my_key_pair.key_name
tags = {
    Name = var.ec2_name
  }
}
