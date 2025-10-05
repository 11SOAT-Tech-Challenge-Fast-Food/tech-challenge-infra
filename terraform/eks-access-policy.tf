resource "aws_eks_access_policy_association" "eks_access_policy" {
  cluster_name  = aws_eks_cluster.eks_cluster.name
  policy_arn    = var.policyArn
  principal_arn = local.principal_arn

  access_scope {
    type = "cluster"
  }
}