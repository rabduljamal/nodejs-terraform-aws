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
  access_key = "AKIA5LWB7E62Y6O3HBSD"
  secret_key = "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"
}