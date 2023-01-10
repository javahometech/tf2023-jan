resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = var.tags
}

resource "aws_subnet" "public" {
    count = var.subnet_count
    vpc_id = aws_vpc.main.id
    availability_zone = local.az_names[count.index]
    cidr_block = var.pub_cidrs[count.index]
    tags = {
      "Name" = "tf-public-subnet"
    }
}
# create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main"
  }
}

# create route table for public subnet
resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-rt"
  }
}

# subnet association
resource "aws_route_table_association" "a" {
  count = var.subnet_count
  subnet_id      = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.r.id
}

# Creation of private subnets

resource "aws_subnet" "private" {
    count = var.subnet_count
    vpc_id = aws_vpc.main.id
    availability_zone = local.az_names[count.index]
    cidr_block = var.pri_cidrs[count.index]
    tags = {
      "Name" = "tf-private-subnet"
    }
}

# create route table for private subnet
resource "aws_route_table" "p" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private-rt"
  }
}

# private subnet association
resource "aws_route_table_association" "p" {
  count = var.subnet_count
  subnet_id      = aws_subnet.private.*.id[count.index]
  route_table_id = aws_route_table.p.id
}

