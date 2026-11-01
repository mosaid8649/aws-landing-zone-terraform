module "vpc" {
  source = "./modules/vpc"
  name   = "dev-vpc"
  cidr   = "10.0.0.0/16"
  cidr1  = "10.0.0.0/24"
  cidr2  = "10.0.2.0/24"
}
