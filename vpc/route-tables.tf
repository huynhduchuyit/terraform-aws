################################################################################
# Route Table for Public Subnets
################################################################################
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-${var.env}-rtb-public"
  }

  depends_on = [
    aws_vpc.main
  ]
}

################################################################################
# Route Table for Private Subnets
################################################################################
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-${var.env}-rtb-private"
  }

  depends_on = [
    aws_vpc.main
  ]
}
