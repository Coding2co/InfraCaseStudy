#!/bin/bash
#
#Script to install required packages and tools

#System update
sudo yum update

#GIT
sudo yum install git -y  

#Ansible
sudo yum install ansible -y

#Java-17
sudo yum install java-17

#Dynamic inventory
sudo yum install pip -y
sudo pip install boto3 botocore 

#Terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
