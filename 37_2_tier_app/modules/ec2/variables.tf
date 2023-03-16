variable "instance_type" {
  description = "The instance type of the EC2 instance to be launched."
}

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to be used for launching the EC2 instance."
}

variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instance will be launched."
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched."
}

variable "ec2_name" {
  description = "The name of the EC2 instance."
}

variable "user_data" {
  description = "The user data script to be run on the EC2 instance at launch time."
}

variable "security_groups" {
  description = "A list of security group IDs to be associated with the EC2 instance."
}

variable "key_name" {
  description = "The name of the EC2 key pair to associate with the instance. If provided, you will be able to SSH into the instance using the specified key pair."
}

variable "root_volume_size" {
  description = "The size of the root volume to associate with the instance."
}