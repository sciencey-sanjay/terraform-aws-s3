output "bucket_name" {
  value = "${module.s3test_child.bucket_name}"
}

output "bucket_id" {
  value = "${module.s3test_child.bucket_id}"
}

output "bucket_arn" {
  value = "${module.s3test_child.bucket_arn}"
}

output "bucket_domainname" {
  value = "${module.s3test_child.bucket_domainname}"
}
