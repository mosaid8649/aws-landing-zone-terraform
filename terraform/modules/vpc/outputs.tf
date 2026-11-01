output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.dev.id
}

output "subnet_ids" {
  description = "IDs of the public subnets"
  value       = [aws_subnet.dev1.id, aws_subnet.dev2.id]
}