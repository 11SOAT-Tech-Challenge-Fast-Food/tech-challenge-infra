resource "aws_eks_access_entry" "eks_access_entry" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  principal_arn     = local.principal_arn
  kubernetes_groups = ["fiap"]
  type              = "STANDARD"
}