variable "cidr" {
  type        = string
  description = "CIDR range for the VPC"
}

variable "cidr1" {
  type        = string
  description = "CIDR range for public subnet 1"
}

variable "cidr2" {
  type        = string
  description = "CIDR range for public subnet 2"
}

variable "name" {
  type        = string
  description = "Name for the VPC and prefix for its resources, for example dev-vpc"
}