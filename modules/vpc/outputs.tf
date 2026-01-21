output "subnet_id" {
  value = aws_subnet.Bob_public-SN.id
}

output "sg" {
  value = aws_security_group.BOB-sg.id
}