# R2 Bucket Terraform Module

Reusable Terraform module for provisioning and configuring Cloudflare R2 object storage buckets with optional CORS policies and configurable storage classes.

## Features

- **Storage Class**: Defaults to `Standard`, supports `InfrequentAccess`.
- **CORS Management**: Optional CORS policies with secure default GET/HEAD rules, or custom rules.
- **Placement & Compliance**: Optional `location` hints and `jurisdiction` restrictions.

## Usage

### Basic Example (Standard Defaults)

```hcl
module "storage_bucket" {
  source = "./modules/r2_bucket"

  account_id = var.cloudflare_account_id
  name       = "my-app-storage"
}
```

### Advanced Example (Infrequent Access & Custom CORS)

```hcl
module "archive_bucket" {
  source = "./modules/r2_bucket"

  account_id    = var.cloudflare_account_id
  name          = "my-app-archive"
  storage_class = "InfrequentAccess"
  location      = "apac"

  cors_rules = [
    {
      id              = "allow-frontend"
      max_age_seconds = 86400
      expose_headers  = ["ETag"]
      allowed = {
        methods = ["GET", "PUT", "POST"]
        origins = ["https://example.com"]
        headers = ["*"]
      }
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `account_id` | Cloudflare account ID | `string` | n/a | yes |
| `name` | Name of the R2 bucket | `string` | n/a | yes |
| `storage_class` | Storage class (`Standard` or `InfrequentAccess`) | `string` | `"Standard"` | no |
| `location` | Geographic placement hint (`apac`, `eeur`, `enam`, `weur`, `wnam`, `oc`) | `string` | `null` | no |
| `jurisdiction` | Jurisdiction (`default`, `eu`, `fedramp`, `fedramp-high`, `us`) | `string` | `null` | no |
| `enable_cors` | Whether to configure CORS rules on bucket | `bool` | `true` | no |
| `cors_rules` | Custom CORS rules list | `list(object)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| `bucket_id` | ID of the created R2 bucket |
| `bucket_name` | Name of the created R2 bucket |
| `storage_class` | Storage class configured for the R2 bucket |

## Deletion & Destruction Note

> [!NOTE]
> Cloudflare R2 does not support `force_destroy`. If objects exist in the bucket during `terraform destroy`, Cloudflare API rejects deletion with `409 Conflict: The bucket you tried to delete is not empty`. Buckets must be emptied manually (via Cloudflare Dashboard or S3 client) before destroying.
