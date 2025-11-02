variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default="ami-00d8fc944fb171e29"
  type        = string
}
variable "instance_type" {
  description = "The type of instance to use"
  default="t2.micro"
  type        = string
}
variable "instance_name" {
  description = "The name tag for the EC2 instance"
  default="terra-instance"
  type        = string
}