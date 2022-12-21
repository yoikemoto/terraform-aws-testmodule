module "default" {
  source                  = "terraform-aws-modules/s3-bucket/aws"
  version                 = "~> 3.0"
  bucket                  = var.name
  acl                     = "private"
  attach_public_policy    = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  force_destroy           = true
  cors_rule = []

  tags = {
    Name = var.name
  }
}
