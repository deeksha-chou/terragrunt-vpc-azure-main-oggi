output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "VPC ID."
}

output "igw_id" {
  value       = aws_internet_gateway.internet_gateway.id
  description = "Internet Gateway ID."
}

output "public_subnet_ids" {
  value       = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]
  description = "Public subnet IDs."
}

output "private_app_subnet_ids" {
  value       = [aws_subnet.private_app_subnet_az1.id, aws_subnet.private_app_subnet_az2.id]
  description = "Private application subnet IDs."
}

output "private_data_subnet_ids" {
  value       = [aws_subnet.private_data_subnet_az1.id, aws_subnet.private_data_subnet_az2.id]
  description = "Private data subnet IDs."
}

output "public_route_table_id" {
  value       = aws_route_table.public_route_table.id
  description = "Public route table ID."
}
