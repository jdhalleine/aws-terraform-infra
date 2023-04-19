#vpc variables
region       = "eu-west-2"
project_name = "rentzone"
environment  = "dev"

vpc_cidr               = "10.0.0.0/16"
public_subnet_az1_cidr = "10.0.0.0/24"
public_subnet_az2_cidr = "10.0.1.0/24"

private_app_subnet_az1_cidr = "10.0.2.0/24"
private_app_subnet_az2_cidr = "10.0.3.0/24"

private_data_subnet_az1_cidr = "10.0.4.0/24"
private_data_subnet_az2_cidr = "10.0.5.0/24"

#security groups variables
ssh_ip = "165.225.204.117/32"

#rds
db_name     = "rentzone"
db_username = "jdhalleine"
db_password = "Password123!"

#alb variables 
target_type = "ip"

#s3 variables 
env_file_bucket_name = "jdhalleine-terraform-s3"
env_file_name        = "rentzone.env"

#ecs varibles
  architecture                 = "X86_64"
  container_image              = "835576258342.dkr.ecr.eu-west-2.amazonaws.com/rentzone:latest"