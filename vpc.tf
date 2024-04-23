#---------------------- development VPC ---------------------------------------------
resource "aws_vpc" "devVPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "devVPC"
  }
}

resource "aws_subnet" "public-development" {
  vpc_id     = aws_vpc.devVPC.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_internet_gateway" "igw-development" {
  vpc_id = aws_vpc.devVPC.id
}

resource "aws_route_table" "public_RT-development" {
  vpc_id = aws_vpc.devVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-development.id
  }
}

resource "aws_route_table_association" "public_RT_Associarion-development" {
  subnet_id      = aws_subnet.public-development.id
  route_table_id = aws_route_table.public_RT-development.id
}

# resource "aws_instance" "CI_env" {
#   arn = "arn:aws:ec2:Mumbai:289213558304:instance/i-008d6507593625124" 
#   ami           = "ami-007020fd9c84e18c7"
#   instance_type = "t2.micro"
# }



#---------------------- pre-production VPC ---------------------------------------------
resource "aws_vpc" "preProdVPC" {
  cidr_block = "11.0.0.0/16"
  tags = {
    name = "preProdVPC"
  }
}

resource "aws_subnet" "public-production" {
  vpc_id     = aws_vpc.preProdVPC.id
  cidr_block = "11.0.1.0/24"
}

resource "aws_internet_gateway" "igw-production" {
  vpc_id = aws_vpc.preProdVPC.id
}

resource "aws_route_table" "public_RT-production" {
  vpc_id = aws_vpc.preProdVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-production.id
  }
}

resource "aws_route_table_association" "public_RT_Associarion-production" {
  subnet_id      = aws_subnet.public-production.id
  route_table_id = aws_route_table.public_RT-production.id
}