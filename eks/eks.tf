################################################################################
# EKS Cluster
################################################################################
resource "aws_eks_cluster" "main" {
  name = var.project

  role_arn = data.aws_iam_role.eks_master.arn
  version  = "1.31"

  vpc_config {
    subnet_ids = [
      data.aws_subnet.private_zone_a.id,
      data.aws_subnet.private_zone_b.id
    ]

    endpoint_private_access = true
  }
}

################################################################################
# EKS Node Group
################################################################################
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = var.project
  node_role_arn   = data.aws_iam_role.eks_worker.arn
  subnet_ids = [
    data.aws_subnet.private_zone_a.id,
    data.aws_subnet.private_zone_b.id
  ]
  disk_size      = 30
  instance_types = ["t3a.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }
}
