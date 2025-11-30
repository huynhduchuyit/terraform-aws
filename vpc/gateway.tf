################################################################################
# Internet Gateway for Public Subnets
################################################################################
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-${var.env}-gw"
  }

  depends_on = [
    aws_vpc.main
  ]
}

################################################################################
# NAT Gateway for Private Subnets
################################################################################
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_zone_a.id

  tags = {
    Name = "${var.project}-${var.env}-nat"
  }

  depends_on = [
    aws_eip.nat,
    aws_subnet.public_zone_a
  ]
}
