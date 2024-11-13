# route_table.tf
resource "aws_route_table" "custom_route_table" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_igw.id
  }

  tags = {
    Name = "CustomRouteTable"
  }
}

resource "aws_route_table_association" "custom_route_table_assoc" {
  subnet_id      = aws_subnet.custom_subnet.id
  route_table_id = aws_route_table.custom_route_table.id
}
