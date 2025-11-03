resource "aws_vpc" "test1" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.test1.id
  cidr_block        = var.aws_subnet.public_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = var.subnet_name
    map_public_ip_on_launch = "true"
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.test1.id
  cidr_block        = var.aws_subnet.public_subnet_2_cidr
  availability_zone = var.availability_zone
    tags = {
        Name = var.subnet_name
        map_public_ip_on_launch = "true"
    }
}
resource "aws_subnet" "private_subnet_1" {
    vpc_id            = aws_vpc.test1.id
    cidr_block        = var.aws_subnet.private_subnet_1_cidr
    availability_zone = var.availability_zone
    tags = {
        Name = var.private_subnet_name
    }
}
resource "aws_subnet" "private_subnet_2" {
    vpc_id            = aws_vpc.test1.id
    cidr_block        = var.aws_subnet.private_subnet_2_cidr
    availability_zone = var.availability_zone
    tags = {
        Name = var.private_subnet_name
    }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.test1.id
  tags = {
    Name = var.igw_name
  }
}
resource "aws_eip" "nat_eip" {
    domain="vpc"
}
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public_subnet_1.id
    tags = {
        Name = var.nat_gw_name
    }
    depends_on=[aws_internet_gateway.igw]
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.test1.id
  route {
    cidr_block = var.public_route_table_cidr
    gateway_id = aws_internet_gateway.igw.id
  }
    tags = {
    Name = var.route_table_name
  }
}
resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.test1.id
    route {
        cidr_block = var.private_route_table_cidr
        nat_gateway_id = aws_nat_gateway.nat_gw.id
    }
    tags = {
        Name = var.private_route_table_name
    }
}
resource "aws_route_table_association" "public_rt_assoc_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_rt_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "private_rt_assoc_1" {
    subnet_id = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "private_rt_assoc_2" {
    subnet_id = aws_subnet.private_subnet_2.id
    route_table_id = aws_route_table.private_rt.id
}
resource "aws_security_group" "vpc_sg" {
  name        = var.security_group_name
  description = "Security group for VPC"
  vpc_id      = aws_vpc.test1.id

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.ssh_protocol
    cidr_blocks = var.allowed_ssh_cidr
  }
  ingress {
    description = "HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.http_protocol
    cidr_blocks = var.allowed_http_cidr
  }
    egress {
        from_port   = varegress_from_port
        to_port     = var.egress_to_port
        protocol    = var.egress_protocol
        cidr_blocks = var.allowed_egress_cidr
    }
}