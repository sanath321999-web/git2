
module "ec2_instance" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name
  }
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  public_subnet_1_cidr              = var.public_subnet_1_cidr
  public_subnet_2_cidr              = var.public_subnet_2_cidr
  private_subnet_1_cidr             = var.private_subnet_1_cidr
  private_subnet_2_cidr             = var.private_subnet_2_cidr
  public_subnet_1_availability_zone = var.public_subnet_1_availability_zone
  public_subnet_2_availability_zone = var.public_subnet_2_availability_zone
  private_subnet_1_availability_zone = var.private_subnet_1_availability_zone
  private_subnet_2_availability_zone = var.private_subnet_2_availability_zone
  public_subnet_1_name              = var.public_subnet_1_name
  public_subnet_2_name              = var.public_subnet_2_name
}
