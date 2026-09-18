# Cloudflare D1 Database Module

Reusable Terraform module to provision Cloudflare D1 SQL databases with flexible configuration options.

## Features

- Provisions serverless SQL database with `cloudflare_d1_database`.
- Optional `primary_location_hint` for geographic engine placement (`apac`, `eeur`, `enam`, `weur`, `wnam`, `oc`).
- Matches Cloudflare console UI defaults (automatic placement if hint is omitted or null).

## Usage

```hcl
module "d1_catalog" {
  source = "./modules/d1_database"

  account_id            = var.cloudflare_account_id
  name                  = "itea-catalog"
  primary_location_hint = "apac" # Optional: omit or null for automatic placement (console default)
}
```

## Inputs

| Name | Type | Description | Default | Required |
|------|------|-------------|---------|:--------:|
| `account_id` | `string` | Cloudflare account ID | n/a | yes |
| `name` | `string` | Name of the D1 database | n/a | yes |
| `primary_location_hint` | `string` | Geographic placement hint (`apac`, `eeur`, `enam`, `weur`, `wnam`, `oc`) | `null` (Automatic) | no |

## Outputs

| Name | Type | Description |
|------|------|-------------|
| `database_id` | `string` | Unique UUID of the D1 database |
| `database_name` | `string` | Name of the D1 database |
| `version` | `string` | Version of the D1 database |
