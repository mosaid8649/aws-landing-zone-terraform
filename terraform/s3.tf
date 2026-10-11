resource "aws_s3_bucket" "testbuckey" {
  bucket = "mosaid8649bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
 

terraform {
  backend "s3" {
    bucket = "mosaid8649-s3-bucket"
    key    = "dev/terraform-multi/terraform.tfstate"
    region = "eu-west-2"
    use_lockfile = true
  }
}
