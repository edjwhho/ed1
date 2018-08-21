# variables.tf
variable "region" {
default = "us-west-1"
#default = "us-east-1"
}

variable "tagnames" {
	default= "DEV_TEST1"
}

variable "key_name" {
  default = "aws1" 
}

variable "pub_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCv6Zb80wipqqAm2TZAKDF7jJzDvMR9QeEO7rrjAy7B/0GiYqmJOeajvQMzZ/8djhx0GkxzMuYNy/QIqjLkckZkWQ5OAEi0Jqt2IlmghwFWE72W591pPjRAQCNnD1EC72ifuTyxQxziAraaJ2f9+dBuoHUJDbfRNwq3fFl2jsfttG98y09RXqgsEuHqCKNr4UaaGk2jrAykZuztZIjkxvIRVhbQlDzeBi8G1Argu8nmamg/sHTZgLDVjPnmDZz7Z3qGlwi6FsIIabQ8gsYVB5bPbePkZqtpXGNk5wvEAifxoJa8myZTYZgBOo07gJPHXjnzdK/tI6yH4369LCPvgkVRaf+u4o/XFiX1Ci/zj4MmPogelUEF9zFLAKRWJKb11Gp0uP0rb88ZT2txzZK6UWiZehKNCJiSFFQ/JdznC8+JyVw8/BwjHSFElNfrCTaIRQnZlncT7lPW5g8I/Frr9hkcuJQ7440yeZfr81OAqoE+rSNWQ/o2IfXVDkjLSinz2tUfvOja2opozF1nrKmNimUIJlN+Ir2AxqJDNmxv5J1bPxP1R/CvjKKpAWjAfU2BMwWmS51/362mm0W77dD+MnZBton+xKfZ4JcEqO+taVZEMtrTyFbAznzaOqv3GMaAw+D0z/OkH+UqWw/kG4dtyVPdyS+ZSV6lL46ZiSUiy3xIzQ== your_email@example.com"
}


variable "availabilityZone" {
        default = "us-west-1a"
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
        default = [ "90.254.132.108/32" ]
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
