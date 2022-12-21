output "bucket_name" {
  value = var.name
}

output "iam_policy_document_json" {
  value = join("", data.aws_iam_policy_document.s3_policy.*.json)
}
