# ec2.tf
resource "aws_instance" "nginx_instance" {
  ami           = "ami-0984f4b9e98be44bf"  # Replace with your preferred Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.custom_subnet.id

  # Use vpc_security_group_ids instead of security_groups
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

  tags = {
    Name = "NginxWebServer"
  }
}

