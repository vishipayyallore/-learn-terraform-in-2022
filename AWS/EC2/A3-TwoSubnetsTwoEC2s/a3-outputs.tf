output "web_servers_ips" {
  # join all the instance private IPs with commas separating them
  value = join(", ", aws_instance.web_server.*.private_ip)
}
