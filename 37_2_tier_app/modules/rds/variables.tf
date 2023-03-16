variable "password" {
  description = "The password for the database administrator."
}

variable "identifier" {
  description = "The name of the RDS instance."
}

variable "engine" {
  description = "The name of the database engine to be used."
}

variable "engine_version" {
  description = "The version of the database engine to be used."
}

variable "db_name" {
  description = "The name of the database to be created when the RDS instance is created."
}

variable "username" {
  description = "The username for the database administrator."
}

variable "subnet_ids" {
  description = "A list of IDs of subnets to launch the RDS instance in."
}

variable "vpc_security_group_ids" {
  description = "A list of IDs of security groups for the RDS instance."
}

variable "instance_class" {
  description = "The instance type to be used for the RDS instance."
}

variable "allocated_storage" {
  description = "The amount of storage to be allocated for the RDS instance, in gigabytes."
}

variable "storage_type" {
  description = "The storage type to be used for the RDS instance, either 'standard' or 'gp2'."
}

variable "multi_az" {
  description = "Whether or not to create a multi-AZ RDS instance."
}