resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = {
      "Name" = "tf-vpc"
      "Department" = "Finance"
      "Location" = "Banglore"
      "User" = "Hari kammana"
    }
}

resource "aws_subnet" "pub_subnets" {
  count = length(var.pub_sub_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = var.pub_sub_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  tags = {
    "Name" = "Subenet-1"
  }
}