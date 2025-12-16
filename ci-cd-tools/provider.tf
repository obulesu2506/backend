terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }

  backend "s3" {
    bucket = "82s-dont-tf-remote-state"
    key    = "expense-cicd-tools-don"
    region = "us-east-1"
    #dynamodb_table = "82s-dont-tf-remote-state"
    encrypt      = true
    use_lockfile = true
  }
}
provider "aws" {
  #configuration settings
  region = "us-east-1"
}