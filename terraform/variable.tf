#Provider

variable "default_region" {
 description = "AWS region of the resources"
 type = string
}

#VPC

variable "vpc_cidr" {
 description = "Casestudy batch-1 VPC cidr block"
 type = string
}

variable "dns_support" {
 description = "Allowing dns support inside the VPC"
 type = bool
}

variable "dns_hostnames" {
 description = "Allowing dns hostnames inside the VPC"
 type = bool
}

variable "tags" {
 description = "default tags"
 type = map(string)
}

#Subnet

variable "subnet_cidr" {
 description = "Casestudy batch-1 subnet cidr block"
 type = string
 }

variable "avail_zone" {
 description = "Availability Zone"
 type        = string
}
#Route Table

variable "rtb_cidr" {
 description = "Casestudy batch-1 routetable cidr block"
 type = string
}

#Security Group

variable "sg_name" {
 description = "Casestudy batch-1 security group"
 type = string
}

variable "sg_des" {
 description = "Description of security grp"
 type        = string
 }

#Inbound rules

variable "all_traffic_cidr" {
  description = "allowing all traffic from anywhere"
  type        =  string
}

variable "https_port" {
  description = "port number of https"
  type        = number
}

variable "http_port" {
  description = "port number of http"
  type        = number
}

variable "ssh_port" {
  description = "port number of ssh"
  type        = number
}

variable "protocol" {
  description = "Ip protocol of rules"
  type        = string
}

variable "my_ip" {
  description = "ssh allowed ip address"
  type        = string
}


#Outbound rules

variable "all_traffic_protocol" {
 description = "allowing all traffic protocol"
 type        = string
 default     = "-1"
}


#EC2Instance

variable "ami_id" {
 description = "Image id of the EC2Instance"
 type        = string
}

variable "instance_type" {
 description = "Instance type of the instance"
 type        = string
}

variable "instance_monitor_status" {
 description = "enabling monitoring for EC2Instance"
 type        = bool
}

variable "ssh_key" {
  description = "Key-Value pair stored in Jenkins"
  type 	      = string
}




