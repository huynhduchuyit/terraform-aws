################################################################################
# Fetch available Availability Zones
################################################################################
data "aws_availability_zones" "available" {
  state = "available"
}

################################################################################
# Public Subnets
################################################################################
resource "aws_subnet" "public_zone_a" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = data.aws_availability_zones.available.names[0]
  cidr_block              = cidrsubnet("10.0.0.0/16", 4, 0)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-${var.env}-subnet-public-a"
  }

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_subnet" "public_zone_b" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = data.aws_availability_zones.available.names[1]
  cidr_block              = cidrsubnet("10.0.0.0/16", 4, 1)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-${var.env}-subnet-public-b"
  }

  depends_on = [
    aws_vpc.main
  ]
}

################################################################################
# Private Subnets
################################################################################
resource "aws_subnet" "private_zone_a" {
  vpc_id            = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = cidrsubnet("10.0.0.0/16", 4, 2)

  tags = {
    Name = "${var.project}-${var.env}-subnet-private-a"
  }

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_subnet" "private_zone_b" {
  vpc_id            = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = cidrsubnet("10.0.0.0/16", 4, 3)

  tags = {
    Name = "${var.project}-${var.env}-subnet-private-b"
  }

  depends_on = [
    aws_vpc.main
  ]
}
