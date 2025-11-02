output "instance_public_ip" {
  value = aws_instance.test1.public_ip
  description = "Public IP address of the EC2 instance"
}