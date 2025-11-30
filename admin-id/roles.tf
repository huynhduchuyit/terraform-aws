################################################################################
# IAM Role for EKS Cluster
################################################################################
resource "aws_iam_role" "eks_master" {
  name = "${var.project}-master"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

################################################################################
# IAM Role for EKS Node Group
################################################################################
resource "aws_iam_role" "eks_worker" {
  name = "${var.project}-worker"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}
