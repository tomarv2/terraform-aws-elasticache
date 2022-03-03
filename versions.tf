terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      version = "~> 3.63"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.profile
}
