data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "dev" {
  cidr_block = var.cidr
  tags       = { Name = var.name }
}

resource "aws_subnet" "dev1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.cidr1
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags                    = { Name = "${var.name}-subnet-1" }
}

resource "aws_subnet" "dev2" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.cidr2
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags                    = { Name = "${var.name}-subnet-2" }
}

resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
  tags   = { Name = "${var.name}-igw" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }

  tags = { Name = "${var.name}-public-rt" }
}

resource "aws_route_table_association" "dev1" {
  subnet_id      = aws_subnet.dev1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "dev2" {
  subnet_id      = aws_subnet.dev2.id
  route_table_id = aws_route_table.public.id
}