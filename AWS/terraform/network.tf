################################################
#  AWS VPC For BeeGFS        
#  by Simon Stockhause 
###############################################

# Defines The AWS VPC
resource "aws_vpc" "beeGFS-vpc" {
  cidr_block = "${var.cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "beeGFS VPC"
  }
}
# Define the public subnet
resource "aws_subnet" "beeGFS-public-subnet" {
  vpc_id = "${aws_vpc.beeGFS-vpc.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "${var.region}b" #smelly string

  tags = {
    Name = "beeGFS Public Subnet"
  }
}

# Define The Public Route Table
# Routing All Traffic Through Internet Gateway
resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.beeGFS-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
    Name = "beeGFS Public Subnet RT"
  }
}
# Assign The Route Table To Public Subnet
resource "aws_route_table_association" "public-rt" {
  subnet_id = "${aws_subnet.beeGFS-public-subnet.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}

# Define The Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.beeGFS-vpc.id}"
  tags = {
    Name = "beeGFS VPC IGW"
  }
}
