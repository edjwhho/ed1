# main.tf 
# Create VPC/Subnet/Security Group/ACL

provider "aws" {
  #region = "us-east-1"
  region = "us-west-1"
  skip_region_validation = true
}

terraform {
 backend "s3" {
 encrypt = true
 bucket = "ts1-states-s3"
 dynamodb_table = "ts1-lock-dynamo"
 region = "us-west-1"
 #region = "us-east-1"
 key = "ed1/terraform.tfstate"
 }
}


resource "aws_key_pair" "auth" {
  key_name   = "aws1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCv6Zb80wipqqAm2TZAKDF7jJzDvMR9QeEO7rrjAy7B/0GiYqmJOeajvQMzZ/8djhx0GkxzMuYNy/QIqjLkckZkWQ5OAEi0Jqt2IlmghwFWE72W591pPjRAQCNnD1EC72ifuTyxQxziAraaJ2f9+dBuoHUJDbfRNwq3fFl2jsfttG98y09RXqgsEuHqCKNr4UaaGk2jrAykZuztZIjkxvIRVhbQlDzeBi8G1Argu8nmamg/sHTZgLDVjPnmDZz7Z3qGlwi6FsIIabQ8gsYVB5bPbePkZqtpXGNk5wvEAifxoJa8myZTYZgBOo07gJPHXjnzdK/tI6yH4369LCPvgkVRaf+u4o/XFiX1Ci/zj4MmPogelUEF9zFLAKRWJKb11Gp0uP0rb88ZT2txzZK6UWiZehKNCJiSFFQ/JdznC8+JyVw8/BwjHSFElNfrCTaIRQnZlncT7lPW5g8I/Frr9hkcuJQ7440yeZfr81OAqoE+rSNWQ/o2IfXVDkjLSinz2tUfvOja2opozF1nrKmNimUIJlN+Ir2AxqJDNmxv5J1bPxP1R/CvjKKpAWjAfU2BMwWmS51/362mm0W77dD+MnZBton+xKfZ4JcEqO+taVZEMtrTyFbAznzaOqv3GMaAw+D0z/OkH+UqWw/kG4dtyVPdyS+ZSV6lL46ZiSUiy3xIzQ== your_email@example.com"
}

resource "aws_instance" "testserver1" {
  # The connection block tells our provisioner how to
  # communicate with the resource (instance)
  connection {
    # The default username for our AMI
    user = "ubuntu"

    # The connection will use the local SSH agent for authentication.
  }

  ami = "${lookup(var.ubuntu_amis, "${var.os-version}.${var.region}")}" 
  instance_type = "t2.micro"

  # The name of our SSH keypair we created above.
  key_name = "${aws_key_pair.auth.key_name}"

  #our Security group to allow HTTP and SSH access
  #vpc_security_group_ids = ["${aws_security_group.default.id}"]
  vpc_security_group_ids = ["${aws_security_group.DEV_TEST_Security_Group.id}"]

  # We're going to launch into the same subnet as our ELB. In a production
  # environment it's more common to have a separate private subnet for
  # backend instances.
  #subnet_id = "${aws_subnet.default.id}"
  subnet_id = "${aws_subnet.DEV_TEST_Subnet.id}"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World, From Eddie.... My WAN/Public IP address: " > index.html
              nohup busybox httpd -f -p 80 &
              EOF
  tags {

    Name = "terraform_test"
  }


  provisioner "local-exec" {
    command = " curl http://myexternalip.com/raw > index.html "
  }

}

