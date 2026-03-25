output "alb_dns_name" {
  description = "The domain name of the load balancer"
  value       = aws_lb.web_server_lb.dns_name
}
