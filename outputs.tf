output "repository_url" {
  value = aws_ecr_repository.default.repository_url
}
output "repository_name" {
  value = var.name
}
