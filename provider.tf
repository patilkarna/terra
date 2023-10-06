provider "aws" {
  region = "eu-north-1"  # Change this to your desired region
  access_key  = var.aws_access_key
  secret_key  = var.aws_secret_key
}
