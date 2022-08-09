output "ips" {
  # join all the instance private IPs with commas separating them
  value = join(", ", aws_instance.ec2_for_web.*.private_ip)
}

output "site_address" {
  value = aws_elb.web.dns_name
}
