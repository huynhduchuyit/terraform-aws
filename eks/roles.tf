data "aws_iam_role" "eks_master" {
  name = "${var.project}-master"
}

data "aws_iam_role" "eks_worker" {
  name = "${var.project}-worker"
}
