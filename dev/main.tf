provider "aws" {
  region = var.region
}

module "network" {
  source                = "../modules/network"
  env_app               = "elasticapp-beanstalkappenv"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = []
  isolated_subnet_cidrs = var.isolated_subnet_cidrs
  env = "dev"
}

module "db" {
  source                      = "../modules/db"
  rds_password                = "123456AaBb"
  database_subnets            = module.network.isolated_subnet_ids
  env_app                     = "elasticapp-beanstalkappenv"
  vpc_id                      = module.network.vpc_id
  sg_ingress_database_subnets = ["0.0.0.0/0"]
}

module "beanstalk" {
  source           = "../modules/beanstalk"
  public_subnets   = module.network.public_subnet_ids
  vpc_id           = module.network.vpc_id
  elasticapp       = "django-app"
  beanstalkappenv  = "django-env"
  instance         = "t2.micro"
  autoscaling_min  = 1
  autoscaling_max  = 1
  rds_host         = module.db.rds_hostname
  rds_user         = module.db.rds_username
  rds_password     = "123456AaBb"
  rds_db_name      = module.db.rds_db_name
}