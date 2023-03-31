variable "env_app" {}

variable "rds_password" {}

variable "database_subnets" {}

variable "vpc_id" {}

variable "sg_ingress_database_subnets" {
  default = ["10.0.0.0/16"]
}
variable "allow_ports" {
  description = "List of Ports to open for server"
  type        = list
  default     = ["80", "443", "22", "8080"]
}

