output "vpc_id" {
  value = aws_vpc.main.id
}
output "subnet_id" {
  value = [for s in aws_subnet.pub_subnets : s.arn]
}

output "azs" {
  value = data.aws_availability_zones.azs.names
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "pub_sub_count" {
  value = length(var.pub_sub_cidrs)
}