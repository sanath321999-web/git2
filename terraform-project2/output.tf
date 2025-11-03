output "instance_public_ip" {
  value       = module.ec2_instance.instance_public_ip
  description = "Public IP address of the EC2 instance"
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}
output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}
output "security_group_id" {
  value = module.vpc.security_group_id
}