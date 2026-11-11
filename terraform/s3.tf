resource "aws_s3_bucket" "testbuckey" {
  bucket = "mosaid8649bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


terraform {
  backend "s3" {
    bucket       = "mosaid8649-s3-bucket"
    key          = "dev/terraform-multi/terraform.tfstate"
    region       = "eu-west-2"
    use_lockfile = true
  }
}

resource "aws_s3_bucket_public_access_block" "testbuckey" {
  bucket                  = aws_s3_bucket.testbuckey.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
