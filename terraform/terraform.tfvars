#Provider
default_region = "us-east-1" #change to your region

#VPC
vpc_cidr     = "10.0.0.0/16"
dns_support   = true
dns_hostnames = true

tags = {
   FASMException = "LKMTrainingRequirement"
   Application   = "apache-server"
   Owner         = "CaseStudyBatch01"
   Project       = "InfraDevOps-CaseStudy"
}

#Subnet

subnet_cidr = "10.0.0.0/24"
avail_zone  = "us-east-1b"  #change to your availability zone
rtb_cidr    = "0.0.0.0/0"

#Security Group
sg_name  = "Batch_1_sg"
sg_des   = "allowing https,http,ssh on restricted port and all traffic in outbound"

#Inbound rules
all_traffic_cidr = "0.0.0.0/0"
https_port       = "443"
http_port        = "80"
ssh_port	 = "22"
protocol 	 = "tcp"
my_ip            = "0.0.0.0/0"   #change to your ip address

#Outbound rule 
all_traffic_protocol = "-1"

#EC2Instance
ami_id                  = "ami-0df8c184d5f6ae949" #change to your desired AMI-Id
instance_type           = "t2.micro"
instance_monitor_status = "true"
ssh_key                 = "demosever"             #change to your keyvalue pair name.


