resource "aws_instance" "Bob-ec2" {
  instance_type = var.instance_type
  ami = var.ami
  security_groups = [var.sg]
  subnet_id = var.subnet_id
  tags = {
    Name="Bob Ec2"
  }
}