provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "jhc-iac"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "iac-lock"
  }
}