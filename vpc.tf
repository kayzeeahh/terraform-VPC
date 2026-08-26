//VPC
resource "aws_vpc" "vpc-main" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "vpc-main"
  }
}

//Public Subnet - AZ1
resource "aws_subnet" "pub-subnet-main-1" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "pub-subnet-main-1"
  }
}

//Public Subnet - AZ2
resource "aws_subnet" "pub-subnet-main-2" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "pub-subnet-main-2"
  }
}

//Private subnet AZ1

resource "aws_subnet" "priv-subnet-main-1" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "priv-subnet-main-1"
  }
}

//Private subnet AZ2

resource "aws_subnet" "priv-subnet-main-2" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "priv-subnet-main-2"
  }
}

//IGW
resource "aws_internet_gateway" "igw-main" {
  vpc_id = aws_vpc.vpc-main.id

  tags = {
    Name = "igw-main"
  }
}

//NAT gateway
resource "aws_nat_gateway" "ngw-main" {
  subnet_id     = aws_subnet.example.id

  tags = {
    Name = "ngw-main"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}

resource "aws_route_table" "route-table-main" {
  vpc_id = aws_vpc.vpc-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-main.id
  }

  tags = {
    Name = "route-table-main"
  }
}

resource "aws_route_table_association" "route_table_association-main" {
  subnet_id      = aws_subnet.pub-subnet-main-1.id
  route_table_id = aws_route_table.route-table-main.id
}