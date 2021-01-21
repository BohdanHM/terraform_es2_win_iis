
output "elb-dns-name" {
  value = aws_elb.test_elb.dns_name
}
output "public_webservers_ip" {
  value = aws_instance.webservers.*.public_ip
}
