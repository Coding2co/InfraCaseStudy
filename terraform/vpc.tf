#Data

#for selecting available availability zone dynamically

data "aws_availability_zones" "available" {
 state = "available"
}


#VPC

resource "aws_vpc" "vpc_batch_one" {
 cidr_block = var.vpc_cidr
 enable_dns_support = var.dns_support
 enable_dns_hostnames = var.dns_hostnames
 tags = merge(
    var.tags,
    {
     Name = "vpc-casestudy-batch-1"
    }
 )
}

#Subnet

resource "aws_subnet" "acn_subnet" {
 vpc_id = aws_vpc.vpc_batch_one.id
 cidr_block = var.subnet_cidr
 availability_zone = data.aws_availability_zone.available.names[0]  #It choose first availability zone to create subnet.
 tags = merge(
   var.tags,
   {
    Name = "subnet_batch_1"
   }
 )
}

#Internet Gateway

resource "aws_internet_gateway" "acn_igw" {
  vpc_id = aws_vpc.vpc_batch_one.id
  tags = merge(
    var.tags,
    {
     Name = "InternetGateway-Batch1"
    } 
 ) 
}

#Route Table

resource "aws_route_table" "acn_rtb" {
 vpc_id = aws_vpc.vpc_batch_one.id
 route 	{
  cidr_block = var.rtb_cidr
  gateway_id = aws_internet_gateway.acn_igw.id
  }

#Associations

resource "aws_route_table_association" "acn_rtb_association" {
 subnet_id = aws_subnet.acn_subnet.id
 route_table_id = aws_route_table.acn_rtb.id
 tags = merge(
  var.tags,
  {
   Name = "Routetable-Batch1"
  }
 )
}

#Security Group

resource "aws_security_group" "acn_sg" {
 name = var.sg_name
 description = var.sg_des
 vpc_id = aws_vpc.vpc_batch_one.id
 tags = merge(
   var.tags,
   {
   Name = "Securitygroup-Batch1"
   }
  )
}

#inbound rules

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.acn_sg.id
  cidr_ipv4 = var.all_traffic_cidr
  from_port = var.https_port
  ip_protocol = var.protocol
  to_port = var.https_port
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.acn_sg.id
  cidr_ipv4 = var.all_traffic_cidr
  from_port = var.http_port
  ip_protocol = var.protocol
  to_port = var.http_port
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.acn_sg.id
  cidr_ipv4 = var.my_ip
  from_port = var.ssh_port
  ip_protocol = var.protocol
  to_port = var.ssh_port
}

#outbound rules

resource "aws_vpc_security_group_egress_rule" "all_traffic" {
 security_group_id = aws_security_group.acn_sg.id
 cidr_ipv4 = var.all_traffic_cidr
 from_port = var.port_zero
 to_port   = var.port_zero
 ip_protocol = var.all_traffic_protocol
}



#EC2-Instance

resource "aws_instance" "ec2_instance" {
 ami = var.ami_id
 instance_type = var.instance_type
 subnet_id = aws_subnet.acn_subnet.id
 vpc_security_group_ids = [aws_security_group.acn_sg.id]
 monitoring             = var.instance_monitor_status
 key_name               = var.jenkins_key
 iam_instance_profile   = var.profile_name
 tags   = merge(
   var.tags,
  {
   Name = "EC2Instance-Batch1"
  }
 )
}

 
