output "pc_sn" {
  value = aws_subnet.ps_sn.id
}

output "sg" {
    value = aws_securiy.sg.id
}