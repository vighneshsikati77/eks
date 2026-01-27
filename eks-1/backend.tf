terraform {
  backend "s3" {
    bucket         = "dev-aman-tf-state-128290027464"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}
