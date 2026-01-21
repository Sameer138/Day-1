resource "aws_vpc" "BOB-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "BOB-VPC"
  }
}

resource "aws_subnet" "Bob_public-SN" {
  vpc_id = aws_vpc.BOB-vpc.id
  cidr_block = var.public_cidr
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "BOB-Public Subnet"
  }
}

resource "aws_security_group" "BOB-sg" {
  name = "BOB-SG"
  vpc_id = aws_vpc.BOB-vpc.id
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ext_ip]
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [var.ext_ip]
  }
}