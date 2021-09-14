module "s3test_child" {
  source = "../../.."

  environment = "test"
  bucketname  = "s3-website-interview-test" 
  aclvalue    = "private"
  cf_oai_arn  = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity EO2JZS2WYUPON"]
}
