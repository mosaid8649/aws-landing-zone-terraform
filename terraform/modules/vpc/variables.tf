variable "cidr" {
  type        = string
  description = "CIDR range for VPC "
}

variable "cidr1" {
  type        = string
  description = "CIDR range for dev public subnet 1 "
}

variable "cidr2" {
  type        = string
  description = "CIDR range for dev public subnet 2 "
}

variable "name" {
  type        = string
  description = "the name for the VPC and the prefix for its resources, for example dev-vpc"
}

