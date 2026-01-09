resource "aws_ecr_repository" "ecr_repo" {
  for_each = toset(var.services)
  
  name = "${var.projectName}-${each.key}"

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name    = "${var.projectName}-${each.key}"
    Service = each.key
    Project = var.projectName
  }
}