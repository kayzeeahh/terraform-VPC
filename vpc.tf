//VPC
resource "aws_vpc" "vpc_main" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "vpc_main"
  }
}

//Public Subnet - AZ1
resource "aws_subnet" "pub-subnet-main-1" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "pub-subnet-main-1"
  }
}

//Public Subnet - AZ2
resource "aws_subnet" "pub-subnet-main-2" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "pub-subnet-main-2"
  }
}

//Private subnet AZ1

resource "aws_subnet" "priv-subnet-main-1" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "priv-subnet-main-1"
  }
}

//Private subnet AZ2

resource "aws_subnet" "priv-subnet-main-2" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "priv-subnet-main-2"
  }
}

