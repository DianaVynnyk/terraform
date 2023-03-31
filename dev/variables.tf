variable "region" {
  default     = "us-east-1"
  type        = string
  description = "AWS region"
}

variable "description" {
  type        = string
  default     = ""
  description = "Short description of the Environment"
}

variable "environment_type" {
  type        = string
  default     = "LoadBalanced"
  description = "Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update>"
}

variable "loadbalancer_type" {
  type        = string
  default     = "classic"
  description = "Load Balancer type, e.g. 'application' or 'classic'"
}

variable "public_subnet_cidrs" {
  description = "Public Networks for each AZ"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private Networks for each AZ"
  type        = list(string)
  default     = []
}

variable "isolated_subnet_cidrs" {
  description = "Isolated Networks for each AZ"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
}
variable "cluster-name" {
  default     = "eks-cluster"
  type        = string
  description = "The name of your EKS Cluster"
}
variable "k8s-version" {
  default     = "1.17"
  type        = string
  description = "Required K8s version"
}