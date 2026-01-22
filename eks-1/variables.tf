variable "aws_region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "mern-eks"
}

variable "kubernetes_version" {
  default = "1.29"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
