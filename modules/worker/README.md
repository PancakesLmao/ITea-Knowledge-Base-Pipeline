# Cloudflare Worker Module

Reusable Terraform module to provision an initial Cloudflare Worker script shell.

## Features

- Provisions and manages Worker script via `cloudflare_workers_script`.
- Standard Terraform state tracking for script content and runtime settings.

## Usage

```hcl
module "worker_api" {
  source = "./modules/worker"

  account_id = var.cloudflare_account_id
  name       = "iteakb-api"
}
```

## Inputs

| Name | Type | Description | Default | Required |
|------|------|-------------|---------|:--------:|
| `account_id` | `string` | Cloudflare account ID | n/a | yes |
| `name` | `string` | Name of the Worker script | n/a | yes |
| `content` | `string` | Initial JavaScript/TypeScript content | `"export default { fetch() { return new Response(\"Worker initialized\"); } };"` | no |
| `compatibility_date` | `string` | Workers runtime compatibility date (`YYYY-MM-DD`) | `null` | no |
| `compatibility_flags` | `list(string)` | List of compatibility flags | `[]` | no |
| `tags` | `list(string)` | Tags for organizing and filtering Workers | `[]` | no |

## Outputs

| Name | Type | Description |
|------|------|-------------|
| `id` | `string` | Unique identifier of the Worker script |
| `name` | `string` | Name of the Worker script |
| `created_on` | `string` | Creation timestamp |
