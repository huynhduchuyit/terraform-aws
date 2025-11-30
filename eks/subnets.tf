data "aws_subnet" "private_zone_a" {
  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-subnet-private-a"]
  }
}

data "aws_subnet" "private_zone_b" {
  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-subnet-private-b"]
  }
}
