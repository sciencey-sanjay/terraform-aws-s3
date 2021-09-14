## Variables Definition

variable "aws_region" {
  default = "us-west-1"
}

variable "bucketname" {
  type = string
}

variable "aclvalue" {
  type = string
}

variable "environment" {
  type = string
}

variable "cf_oai_arn" {
  type = list(string)
}
