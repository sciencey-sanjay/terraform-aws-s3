#  Terraform module to implement S3 

# Provider

terraform {
  required_providers {
    mycloud = {
      source  = "hashicorp/aws"
      version = "~> 2.7.0"
    }
  }
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

provider "mycloud" {
  region = var.aws_region 
}
resource "aws_s3_bucket" "b" {
  bucket = var.bucketname
  acl    = var.aclvalue 
}
resource "aws_s3_bucket_policy" "b_policy" {
  bucket = aws_s3_bucket.b.id
  policy = data.aws_iam_policy_document.s3_policy.json
}
