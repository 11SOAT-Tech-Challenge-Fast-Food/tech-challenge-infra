# resource "random_id" "suffix" {
#   byte_length = 4
# }

# resource "aws_s3_bucket" "bucket_backend" {
#   bucket = "${var.projectName}-${random_id.suffix.hex}"
# }