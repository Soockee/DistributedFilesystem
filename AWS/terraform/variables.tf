################################################
#  AWS Terraform For BeeGFS        
#  by Simon Stockhause 
################################################

variable "region" {
  default = "us-west-2"
}
variable "aws_profile" {
  description = "Local aws profile to use for provisioning resoources"
  default = "default"
}
variable "beeGFS_managment_instance_type" {
  default = "t2.micro"
}
variable "beeGFS_metadata_instance_type" {
  default = "t2.micro"
}
variable "beeGFS_storage_instance_type" {
  default = "t2.micro"
}
variable "beeGFS_client_instance_type" {
  default = "t2.micro"
}
variable "keypair" {
  description = "Keypair to use for EC2 Instances"
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "The Public Subnet CIDR block for the VPC."
  default     = "10.0.3.0/24"
}

variable "ssh_private_key_file_path" {}
