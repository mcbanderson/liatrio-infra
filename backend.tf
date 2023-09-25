terraform {
  backend "s3" {
    bucket         = "max-anderson-liatrio-tf-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}
