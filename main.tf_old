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
 public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9/p3OggVe59tF5vcFh3xXdahdyTiYCftUBLFhnd2ws0W2IpQ4OfRIYLRImxKtX0roYObQba5OmcTVF1GuCmAsr+LWIVKcrmxh79lk86YqddtiGOm0AwOUCwncSYYFLVkmOwJzJQKIx8ypmf0sEALNCl5McQD/DDUibC8F/L9cIfO6Tvf8zJHYlLmM2mZyix6rLbZ6u7CqTdbd3llyYBK2NSuhbKo+HnnvVQrCDLthyRKzKCYq51+yHPlX5irANj1GYGwNLtgQnKDxcBH66PPhvKbdP5kjfqn62PEKcBzdOSrG07kogLCHAJE+oha80F/Lg6pCsT+BWqMBXeKWASc30SnpP5p/9VKt5MGrFCjRR+7nusY/0go6epAq/FcZUWvPjQdSoOjVphtbBxbB37GYWZS/cLUswt9y1yYQSPqbpQXb5vKlBfIJEfh+5exUtP0LtPIoQey/5zzzDCuj1jxHy0KAP8vWvUDQyAEIt0OBQwyH0jU8/i6MQ4Rr1xq72ZM= manav@MSI"
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.my_key_pair.key_name
tags = {
    Name = var.ec2_name
  }
}
