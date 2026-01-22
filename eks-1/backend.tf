terraform {
  backend "s3" {
    bucket         = "dev-aman-tf-bucket-ap"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}
