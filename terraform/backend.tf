terraform {
  backend "s3" {
    bucket = "tc-fiap-fast-food-16299ad5"
    key    = "fiap-tc/terraform.tfstate"
    region = "us-east-1"
  }
}