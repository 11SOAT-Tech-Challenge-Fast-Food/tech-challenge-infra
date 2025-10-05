resource "aws_eks_cluster" "eks_cluster" {
  name = "eks-cluster-${var.projectName}"

  access_config {
    authentication_mode = var.accessConfig
  }

  role_arn = local.labRole
  version  = "1.32"

  vpc_config {
    subnet_ids = [
      aws_subnet.subnet_public[0].id,
      aws_subnet.subnet_public[1].id,
      aws_subnet.subnet_public[2].id
    ]
    security_group_ids = [aws_security_group.sg.id]
  }
}