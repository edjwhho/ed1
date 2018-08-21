# ec2.tf 
# Create VPC/Subnet/Security Group/ACL

provider "aws" {
  region = "${var.region}"
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
  key_name   = "${var.key_name}"
  public_key = "${var.pub_key}"
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

