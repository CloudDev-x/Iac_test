# outputs.tf
output "nginx_instance_public_ip" {
  value = aws_instance.nginx_instance.public_ip
  description = "The public IP address of the NGINX web server"
}
