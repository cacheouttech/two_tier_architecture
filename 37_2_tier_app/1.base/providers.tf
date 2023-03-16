terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.55"
    }
  }
}

provider "aws" {
  region = "us-west-2" ###REGION
}