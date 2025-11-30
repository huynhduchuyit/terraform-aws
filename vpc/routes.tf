################################################################################
# Default Route for Public Subnets
# All outbound traffic from public subnets go through Internet Gateway
################################################################################
resource "aws_route" "public_gw_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id

  depends_on = [
    aws_route_table.public_route_table,
    aws_internet_gateway.gw
  ]
}

################################################################################
# Default Route for Private Subnets
# All outbound traffic from private subnets go through NAT Gateway
################################################################################
resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id

  depends_on = [
    aws_route_table.private_route_table,
    aws_nat_gateway.nat
  ]
}

################################################################################
# Route Table Associations - Public Subnets
################################################################################
resource "aws_route_table_association" "public_association_zone_a" {
  subnet_id      = aws_subnet.public_zone_a.id
  route_table_id = aws_route_table.public_route_table.id

  depends_on = [
    aws_subnet.public_zone_a,
    aws_route_table.public_route_table
  ]
}

resource "aws_route_table_association" "public_association_zone_b" {
  subnet_id      = aws_subnet.public_zone_b.id
  route_table_id = aws_route_table.public_route_table.id

  depends_on = [
    aws_subnet.public_zone_b,
    aws_route_table.public_route_table
  ]
}

################################################################################
# Route Table Associations - Private Subnets
################################################################################
resource "aws_route_table_association" "private_association_zone_a" {
  subnet_id      = aws_subnet.private_zone_a.id
  route_table_id = aws_route_table.private_route_table.id

  depends_on = [
    aws_subnet.private_zone_a,
    aws_route_table.private_route_table
  ]
}

resource "aws_route_table_association" "private_association_zone_b" {
  subnet_id      = aws_subnet.private_zone_b.id
  route_table_id = aws_route_table.private_route_table.id

  depends_on = [
    aws_subnet.private_zone_b,
    aws_route_table.private_route_table
  ]
}
