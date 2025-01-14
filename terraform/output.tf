#output file for casestudy


output "vpc_id" {
  value = aws_vpc.vpc_batch_one.id
}

output "route_table_ip" {
  value = aws_route_table.acn_rtb.id
}

output "security_group_id" {
  value = aws_security_group.acn_sg.id
}

output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "instance_id" {
  value = aws_instance.ec2_instance.id

}

