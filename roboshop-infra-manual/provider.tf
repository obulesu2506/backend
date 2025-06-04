terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.84.0"
    }
  }
  backend "S3" {
    bucket = "82s-dont-tf-remote-state-dev"
    key = "roboshop-infra" //Unique name for any new deployment
    region = "us-east-1"
    encrypt = true
    use_lockfile = true //
  }
}
provider "aws" {
    #configuration Options
    region = "us-east-1"  
}