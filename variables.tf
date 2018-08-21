# variables.tf
variable "region" {
default = "us-west-1"
#default = "us-east-1"
}

variable "tagnames" {
	default= "DEV_TEST1"
}

#variable "key_name" {
#  default = aws_bastion_host1.pub 
#  
#}

variable "availabilityZone" {
        default = "us-west-1a"
        #default = "us-east-1a"
}

variable "instanceTenancy" {
 default = "default"
}

variable "dnsSupport" {
 default = true
}

variable "dnsHostNames" {
        default = true
}

variable "vpcCIDRblock" {
 default = "10.0.0.0/16"
}

variable "subnetCIDRblock" {
        default = "10.0.1.0/24"
}

variable "destinationCIDRblock" {
        default = "0.0.0.0/0"
}

variable "ingressCIDRblock" {
        type = "list"
        default = [ "90.255.132.223/32" ]
}

variable "mapPublicIP" {
        default = true
}
variable "os-version" {
    description = "Whether to use ubuntu 14 or ubuntu 16"
    default     = "ubuntu14"
}
variable "ubuntu_amis" {
    description = "Mapping of Ubuntu 14.04 AMIs."
    default = {
          ubuntu14.ap-northeast-1 = "ami-a25cffa2"
          ubuntu14.ap-southeast-1 = "ami-967879c4"
          ubuntu14.ap-southeast-2 = "ami-21ce8b1b"
          ubuntu14.cn-north-1     = "ami-d44fd2ed"
          ubuntu14.eu-central-1   = "ami-9cf9c281"
          ubuntu14.eu-west-1      = "ami-664b0a11"
          ubuntu14.sa-east-1      = "ami-c99518d4"
          ubuntu14.us-east-1      = "ami-c135f3aa"
          ubuntu14.us-gov-west-1  = "ami-91cfafb2"
          ubuntu14.us-west-1      = "ami-bf3dccfb"
          ubuntu14.us-west-2      = "ami-f15b5dc1"
          ubuntu16.ap-northeast-1 = "ami-a68e3ec7"
          ubuntu16.ap-southeast-1 = "ami-5b7ed338"
          ubuntu16.ap-southeast-2 = "ami-e2112881"
          ubuntu16.cn-north-1     = "ami-593feb34"
          ubuntu16.eu-central-1   = "ami-df02c5b0"
          ubuntu16.eu-west-1      = "ami-be376ecd"
          ubuntu16.sa-east-1      = "ami-8f34aae3"
          ubuntu16.us-east-1      = "ami-2808313f"
          ubuntu16.us-gov-west-1  = "ami-19d56d78"
          ubuntu16.us-west-1      = "ami-900255f0"
          ubuntu16.us-west-2      = "ami-7df25b1d"
    }
}

# end of variables.tf
