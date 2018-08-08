provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "sg" {
  name        = "allow_8080"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["90.255.159.132/32"]
  }

  tags {
    Name = "allow_8080"
    "type" = "terraform-test-security-group"
  }
}
 
resource "aws_instance" "testserver1" {
  ami = "ami-2d39803a"
  instance_type = "t2.micro"
  security_group = "sg"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags {

    Name = "terraform_test"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = "${aws_security_group.sg.id}"
  network_interface_id = "${aws_instance.testserver1.primary_network_interface_id}"
}
