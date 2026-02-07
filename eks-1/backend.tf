terraform {
  backend "s3" {
    bucket         = "mern-13"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}
