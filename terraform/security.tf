resource "aws_security_group" "test" {
  name        = "dev-test-sg"
  description = "Test security group created by the pipeline"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "dev-test-sg"
  }
}