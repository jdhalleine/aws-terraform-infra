variable "region" {}
variable "project_name" {}
variable "environment" {}

variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az1_cidr" {}
variable "private_data_subnet_az2_cidr" {}

variable "ssh_ip" {}

variable "db_username" {}
variable "db_password" {}
variable "db_name" {}

variable "target_type" {}

variable "env_file_bucket_name" {}
variable "env_file_name" {}

variable "architecture" {}
variable "container_image" {}