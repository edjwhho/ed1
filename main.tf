provider "aws" {
  region = "us-east-1"
}


#resource "aws_key_pair" "auth" {
#  key_name   = "${var.key_name}"
#  public_key = "${file(var.public_key_path)}"
#}


resource "aws_instance" "testserver1" {
  # The connection block tells our provisioner how to
  # communicate with the resource (instance)
  connection {
    # The default username for our AMI
    user = "ubuntu"

    # The connection will use the local SSH agent for authentication.
  }

  ami = "ami-2d39803a"
  instance_type = "t2.micro"

  # The name of our SSH keypair we created above.
#  key_name = "${aws_key_pair.auth.id}"

  #our Security group to allow HTTP and SSH access
  #vpc_security_group_ids = ["${aws_security_group.default.id}"]
  vpc_security_group_ids = ["${aws_security_group.DEV_TEST_Security_Group.id}"]

  # We're going to launch into the same subnet as our ELB. In a production
  # environment it's more common to have a separate private subnet for
  # backend instances.
  #subnet_id = "${aws_subnet.default.id}"
  subnet_id = "${aws_vpc.DEV_TEST.id}"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags {

    Name = "terraform_test"
  }
}

