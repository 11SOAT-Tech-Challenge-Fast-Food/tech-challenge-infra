variable "projectName" {
  default = "tech-challenge-ordermanagement"
}

variable "regionDefault" {
  default = "us-east-1"
}

variable "cidr_vpc" {
  default = "10.0.0.0/16"
}

variable "labRole" {
  default = ""
}


variable "principalArn" {
  default = ""
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "instanceType" {
  default = "t3.medium"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}