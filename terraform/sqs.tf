variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  default     = "dev"
}

# SQS Queue - Processed Payments
resource "aws_sqs_queue" "processed_payments" {
  name                       = "processed-payments-tc-sqs"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600  # 4 days
  receive_wait_time_seconds  = 0
  visibility_timeout_seconds = 30

  tags = {
    Name        = "processed-payments-tc-sqs"
    Project     = var.projectName
    Environment = var.environment
  }
}

# SQS Queue - Order Product Amount
resource "aws_sqs_queue" "order_product_amount" {
  name                       = "order-product-amount-tc-sqs"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600  # 4 days
  receive_wait_time_seconds  = 0
  visibility_timeout_seconds = 30

  tags = {
    Name        = "order-product-amount-tc-sqs"
    Project     = var.projectName
    Environment = var.environment
  }
}

# Dead Letter Queues (DLQ) - Optional but recommended
resource "aws_sqs_queue" "processed_payments_dlq" {
  name                       = "processed-payments-tc-dlq"
  message_retention_seconds  = 1209600  # 14 days

  tags = {
    Name        = "processed-payments-tc-dlq"
    Project     = var.projectName
    Environment = var.environment
  }
}

resource "aws_sqs_queue" "order_product_amount_dlq" {
  name                       = "order-product-amount-tc-dlq"
  message_retention_seconds  = 1209600  # 14 days

  tags = {
    Name        = "order-product-amount-dlq"
    Project     = var.projectName
    Environment = var.environment
  }
}

# Redrive Policy for Processed Payments
resource "aws_sqs_queue_redrive_policy" "processed_payments_redrive" {
  queue_url = aws_sqs_queue.processed_payments.id

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.processed_payments_dlq.arn
    maxReceiveCount     = 3
  })
}

# Redrive Policy for Order Product Amount
resource "aws_sqs_queue_redrive_policy" "order_product_amount_redrive" {
  queue_url = aws_sqs_queue.order_product_amount.id

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.order_product_amount_dlq.arn
    maxReceiveCount     = 3
  })
}
