terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.63.0"
    }
  }
}

provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIAXWWBR52JKX534LGB"
  secret_key = "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"
}
