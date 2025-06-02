terraform {
  backend "s3" {
    bucket = "sunil-tetris-bucket" 
    key    = "EKS/terraform.tfstate"
    region = "us-east-1"
  }
}
