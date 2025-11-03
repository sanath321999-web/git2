variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "ap-southeast-1"
  type        = string
}
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-00d8fc944fb171e29"
  type        = string
}
variable "instance_type" {
  description = "The type of instance to use"
  default     = "t2.micro"
  type        = string
}
variable "instance_name" {
  description = "The name tag for the EC2 instance"
  default     = "terra-instance"
  type        = string
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
  type        = string
}
variable "vpc_name" {
  description = "The name tag for the VPC"
  default     = "terra-vpc"
  type        = string
}
variable "public_subnet_1_cidr" {
  description = "The CIDR block for the public subnet 1"
  default     = "10.0.1.0/24"
  type        = string
}
variable "public_subnet_2_cidr" {
  description = "The CIDR block for the public subnet 2"
  default     = "10.0.2.0/24"
  type        = string
}
variable "private_subnet_1_cidr" {
  description = "The CIDR block for the private subnet 1"
  default     = "10.0.3.0/24"
  type        = string
}
variable "private_subnet_2_cidr" {
  description = "The CIDR block for the private subnet 2"
  default     = "10.0.4.0/24"
  type        = string
}
variable "public_subnet_1_availability_zone" {
  description = "The availability zone for public subnet 1"
  default     = "ap-southeast-1a"
  type        = string
}
variable "public_subnet_2_availability_zone" {
  description = "The availability zone for public subnet 2"
  default     = "ap-southeast-1b"
  type        = string
}
variable "public_subnet_1_name" {
  description = "The name tag for the subnets"
  default     = "public-terra-subnet-1"
  type        = string
}
variable "public_subnet_2_name" {
  description = "The name tag for the subnets"
  default     = "public-terra-subnet-2"
  type        = string
}
variable "private_subnet_1_name" {
  description = "The name tag for the private subnet 1"
  default     = "private-terra-subnet-1"
  type        = string
}
variable "private_subnet_2_name" {
  description = "The name tag for the private subnet 2"
  default     = "private-terra-subnet-2"
  type        = string
}
variable "private_subnet_1_availability_zone" {
  description = "The availability zone for private subnet 1"
  default     = "ap-southeast-1a"
  type        = string
}
variable "private_subnet_2_availability_zone" {
  description = "The availability zone for private subnet 2"
  default     = "ap-southeast-1b"
  type        = string
}
variable "igw_name" {
  description = "The name tag for the Internet Gateway"
  default     = "terra-igw"
  type        = string
}
variable "aws_eip_domain" {
  description = "The domain for the EIP"
  default     = "vpc"
  type        = string
}
variable "nat_gw_name" {
  description = "The name tag for the NAT Gateway"
  default     = "terra-nat-gw"
  type        = string
}
variable "public_route_table_cidr" {
  description = "The destination CIDR block for the public route table"
  default     = "0.0.0.0/0"
  type        = string
}
variable "public_route_table_name" {
  description = "The name tag for the public route table"
  default     = "terra-public-rt"
  type        = string
}

variable "private_route_table_cidr" {
  description = "The destination CIDR block for the private route table"
  default     = "0.0.0.0/0"
  type        = string
}
variable "private_route_table_name" {
  description = "The name tag for the private route table"
  default     = "terra-private-rt"
  type        = string
}
variable "security_group_name" {
  description = "The name tag for the security group"
  default     = "terra-sg"
  type        = string
}
variable "security_group_description" {
  description = "The description for the security group"
  default     = "Security group for terra VPC"
  type        = string
}
variable "allowed_ssh_cidr_blocks" {
  description = "The CIDR blocks for ingress rules"
  default     = ["0.0.0.0/0"]
  type        = list(string)
}
variable "ssh_from_port" {
  description = "The from port for SSH ingress rule"
  default     = 22
  type        = number
}
variable "ssh_to_port" {
  description = "The to port for SSH ingress rule"
  default     = 22
  type        = number
}
variable "ssh_protocol" {
  description = "The protocol for SSH ingress rule"
  default     = "tcp"
  type        = string
}
variable "allowed_http_cidr_blocks" {
  description = "The allowed CIDR blocks for SSH access"
  default     = ["0.0.0.0/0"]
  type        = list(string)
}
variable "http_from_port" {
  description = "The from port for HTTP ingress rule"
  default     = 80
  type        = number
}
variable "http_to_port" {
  description = "The to port for HTTP ingress rule"
  default     = 80
  type        = number
}
variable "http_protocol" {
  description = "The protocol for HTTP ingress rule"
  default     = "tcp"
  type        = string
}
variable "allowed_egress_cidr_blocks" {
  description = "The CIDR blocks for egress rules"
  default     = ["0.0.0.0/0"]
  type        = list(string)
}
variable "egress_from_port" {
  description = "The from port for egress rule"
  default     = 0
  type        = number
}
variable "egress_to_port" {
  description = "The to port for egress rule"
  default     = 0
  type        = number
}
variable "egress_protocol" {
  description = "The protocol for egress rule"
  default     = "-1"
  type        = string
}