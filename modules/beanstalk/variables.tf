variable "elasticapp" {
  description = "ElasticBeanstalk application name"
  default     = "app"
}
variable "beanstalkappenv" {
  description = "ElasticBeanstalk environment name"
  default     = "app-env"
}
variable "solution_stack_name" {
  description = "Get list: aws elasticbeanstalk list-available-solution-stacks"
  default     = "64bit Amazon Linux 2 v3.6.4 running Go 1"
}
variable "tier" {
  default = "WebServer"
}
variable "vpc_id" {
}
variable "public_subnets" {
}

variable "instance" {
  default = "t2.micro"
}
variable "autoscaling_min" {
  description = "Autoscaling min hosts"
  default     = 1
}
variable "autoscaling_max" {
  description = "Autoscaling max hosts"
  default     = 1
}
variable "rds_host" {
  description = "DRS hostname"
  default     = "localhost"
}
variable "rds_user" {
  description = "RDS username"
  default     = "user"
}
variable "rds_password" {
  description = "RDS password"
  default     = "password"
}
variable "rds_db_name" {
  description = "RDS database name"
  default     = "db"
}

