terraform {
  backend "s3" {
    bucket = "ebuka122-terraform-app"
    region = "us-west-2"
    key = "Jenkins-server/terraform.tfstate"
  }
}