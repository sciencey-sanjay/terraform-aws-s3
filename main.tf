#  Terraform module to implement S3 

# Provider

terraform {
  cloud {
    organization = "devopsy_sanjay"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "terraform-aws-s3"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.61.0"
    }
  }
}

provider "aws" {
  region = var.aws_region 
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.b.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = var.cf_oai_arn
    }
  }
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucketname
  acl    = var.aclvalue 
}
resource "aws_s3_bucket_policy" "b_policy" {
  bucket = aws_s3_bucket.b.id
  policy = data.aws_iam_policy_document.s3_policy.json
}
