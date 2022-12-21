resource "aws_ecr_repository" "default" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "default" {
  repository = aws_ecr_repository.default.name

  policy = jsonencode(
    {
      rules = [
        {
          action = {
            type = "expire"
          }
          description  = "Keep last ${var.release_count} release tagged images"
          rulePriority = 1
          selection = {
            tagStatus     = "tagged"
            tagPrefixList = ["release"]
            countType     = "imageCountMoreThan"
            countNumber   = var.release_count
          }
        },
      ]
    }
  )
}
