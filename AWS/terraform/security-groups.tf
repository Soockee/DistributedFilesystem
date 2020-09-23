################################################
#  AWS Security Groups For BeeGFS        
#  by Simon Stockhause 
################################################

# HTTP-Related-Traffic Security Group
resource "aws_security_group" "http" {
  name        = "http public security group"
  description = "Allow inbound HTTP traffic"
  vpc_id      = "${aws_vpc.beeGFS-vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "beeGFS http public security group"
  }
}
# SSH Security Group
resource "aws_security_group" "ssh" {
  name        = "ssh public security group"
  description = "Allow inbound SSH traffic"
  vpc_id      = "${aws_vpc.beeGFS-vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["${var.cidr}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "beeGFS ssh public security group"
  }
}
# pointcloud_tiler Application Security Group
# Defines Applicationsspecific Ports As Accessable 
resource "aws_security_group" "pointcloud_tiler" {
  name        = "pointcloud_tiler public security group"
  description = "Allow inbound HTTP traffic"
  vpc_id      = "${aws_vpc.beeGFS-vpc.id}"

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080  
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80  
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "pointcloud_tiler Application Ports"
  }
}

