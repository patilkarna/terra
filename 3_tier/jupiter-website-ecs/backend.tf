# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "history-log-backup"
    key       = "teeraform-state.tfstae"
    region    = "us-east-1"
    profile   = "default"
  }
}
