terraform {
  backend "s3" {
    bucket = "0810-suheibs-tf-bucket"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}