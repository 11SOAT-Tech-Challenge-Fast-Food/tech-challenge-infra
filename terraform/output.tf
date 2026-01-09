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

output "ecr_repository_urls" {
  description = "URLs of all ECR repositories"
  value       = { for k, v in aws_ecr_repository.ecr_repo : k => v.repository_url }
}

# SQS Outputs
output "processed_payments_queue_url" {
  description = "URL of the processed payments SQS queue"
  value       = aws_sqs_queue.processed_payments.url
}

output "processed_payments_queue_arn" {
  description = "ARN of the processed payments SQS queue"
  value       = aws_sqs_queue.processed_payments.arn
}

output "order_product_amount_queue_url" {
  description = "URL of the order product amount SQS queue"
  value       = aws_sqs_queue.order_product_amount.url
}

output "order_product_amount_queue_arn" {
  description = "ARN of the order product amount SQS queue"
  value       = aws_sqs_queue.order_product_amount.arn
}