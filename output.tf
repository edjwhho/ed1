output "External addresses" {
  value = ["${aws_instance.testserver1.*.public_dns}"]
}
