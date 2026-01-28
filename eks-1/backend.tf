terraform {
  backend "s3" {
    bucket         = "dev-aman-tf-bucket-1113"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}
