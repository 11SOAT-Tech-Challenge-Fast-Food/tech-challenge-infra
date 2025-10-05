output "vpc_cidr" {
  value = aws_vpc.vpc_fiap.cidr_block
}

output "vpc_id" {
  value = aws_vpc.vpc_fiap.id
}

output "subnet_cidr" {
  value = aws_subnet.subnet_public[*].cidr_block
}

output "subnet_id" {
  value = aws_subnet.subnet_public[*].id
}

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr_repo.repository_url
}

output "aws_s3_bucket_name" {
  value = aws_s3_bucket.bucket_backend.bucket 
}