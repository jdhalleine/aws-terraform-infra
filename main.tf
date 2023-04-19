locals {
  region       = var.region
  project_name = var.project_name
  environment  = var.environment
  ssh_ip       = var.ssh_ip
}

#create vpc module
module "vpc" {

  source       = "git@github.com:jdhalleine/aws-terraform.git//vpc"
  region       = local.region
  project_name = local.project_name
  environment  = local.environment

  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr

}

#create nat-gateways
module "nat-gateway" {

  source = "git@github.com:jdhalleine/aws-terraform.git//nat-gateway"

  project_name               = local.project_name
  environment                = local.environment
  public_subnet_az1_id       = module.vpc.public_subnet_az1_id
  public_subnet_az2_id       = module.vpc.public_subnet_az2_id
  internet_gateway           = module.vpc.internet_gateway
  vpc_id                     = module.vpc.vpc_id
  private_app_subnet_az1_id  = module.vpc.private_app_subnet_az1_id
  private_data_subnet_az1_id = module.vpc.private_data_subnet_az1_id
  private_app_subnet_az2_id  = module.vpc.private_app_subnet_az2_id
  private_data_subnet_az2_id = module.vpc.private_app_subnet_az2_id

}

#create security-groups
module "security-groups" {

  source = "git@github.com:jdhalleine/aws-terraform.git//security-groups"

  project_name = local.project_name
  environment  = local.environment
  vpc_id       = module.vpc.vpc_id
  ssh_ip       = local.ssh_ip
}

#create rds
module "rds" {

  source = "git@github.com:jdhalleine/aws-terraform.git//rds"

  project_name = local.project_name
  environment  = local.environment
  db_name      = var.db_name
  db_username  = var.db_username
  db_password  = var.db_password

}

#create alb
module "alb" {
  source = "git@github.com:jdhalleine/aws-terraform.git//alb"

  project_name          = local.project_name
  environment           = local.environment
  alb_security_group_id = module.security-groups.alb_security_group_id
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  public_subnet_az2_id  = module.vpc.public_subnet_az2_id
  target_type           = var.target_type
  vpc_id                = module.vpc.vpc_id
}