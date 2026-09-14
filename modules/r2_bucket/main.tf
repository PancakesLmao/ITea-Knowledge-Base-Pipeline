# Primary resources for R2 bucket module

locals {
  default_cors_rules = [
    {
      id              = "default-allow-read"
      max_age_seconds = 3600
      expose_headers  = ["ETag"]
      allowed = {
        methods = ["GET", "HEAD"]
        origins = ["*"]
        headers = ["*"]
      }
    }
  ]

  effective_cors_rules = var.cors_rules != null ? var.cors_rules : local.default_cors_rules
}

resource "cloudflare_r2_bucket" "this" {
  account_id    = var.account_id
  name          = var.name
  jurisdiction  = var.jurisdiction
  location      = var.location
  storage_class = var.storage_class
}

resource "cloudflare_r2_bucket_cors" "this" {
  count = var.enable_cors ? 1 : 0

  account_id   = var.account_id
  bucket_name  = cloudflare_r2_bucket.this.name
  jurisdiction = var.jurisdiction
  rules        = local.effective_cors_rules
}
