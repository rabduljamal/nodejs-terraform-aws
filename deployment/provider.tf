terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
  access_key = "AKIA5LWB7E6XXXXXXXXX"
  secret_key = "GRrdowppLb9XXXXXXXXX"
}