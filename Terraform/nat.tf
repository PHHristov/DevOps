## Create Elastic IP, quite costly if left undestroyed...

resource "aws_eip" "nat-eip" {
  vpc = "true"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.main-public-1.id
  depends_on    = [aws_internet_gateway.main-gw]
}

## Setup NAT route table ##################################

resource "aws_route_table" "private_main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "main-private-1"
  }
}

resource "aws_route_table_association" "main-private-1-a" {
  route_table_id = aws_route_table.private_main.id
  subnet_id      = aws_subnet.main-private-1.id
}

