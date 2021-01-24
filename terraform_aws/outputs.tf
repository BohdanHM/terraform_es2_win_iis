
output "nlb-dns-name" {
  value = aws_lb.test_nlb.dns_name
}
output "public_webservers_ip" {
  value = aws_instance.webservers.*.public_ip
}
