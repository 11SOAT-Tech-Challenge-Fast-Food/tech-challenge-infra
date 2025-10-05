resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "node-g-${var.projectName}"
  node_role_arn   = local.labRole
  subnet_ids      = aws_subnet.subnet_public[*].id
  disk_size       = 50

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }
}