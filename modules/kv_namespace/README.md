# Cloudflare Workers KV Namespace Module

Reusable Terraform module to provision Cloudflare Workers KV namespaces with flexible configuration options.

## Features

- Provisions key-value storage with `cloudflare_workers_kv_namespace`.
- Optional `jurisdiction` constraint (`eu`, `fedramp`, `us`).

## Usage

```hcl
module "kv_session" {
  source = "./modules/kv_namespace"

  account_id = var.cloudflare_account_id
  title      = "iteakb-session"
}
```

## Inputs

| Name | Type | Description | Default | Required |
|------|------|-------------|---------|:--------:|
| `account_id` | `string` | Cloudflare account ID | n/a | yes |
| `title` | `string` | Title / name of the KV namespace | n/a | yes |
| `jurisdiction` | `string` | Optional jurisdiction (`eu`, `fedramp`, `us`) | `null` | no |

## Outputs

| Name | Type | Description |
|------|------|-------------|
| `id` | `string` | ID of the created Workers KV namespace |
| `title` | `string` | Title of the created Workers KV namespace |
