#output file for casestudy


output "vpc_id" {
  value = aws_vpc.vpc_batch_one.id
  description = "CaseStudy Batch1 VPC id"
}

output "route_table_ip" {
  value = aws_route_table.acn_rtb.id
  description = "CaseStudy Batch1 route table id"
}

output "security_group_id" {
  value = aws_security_group.acn_sg.id
  description = "CaseStudy Batch1 security group id"
}

output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
  description = "CaseStudy Batch1 EC2Instance public ip"
}

output "instance_id" {
  value = aws_instance.ec2_instance.id
  description = "CaseStudy Batch1 Instance id"

}

