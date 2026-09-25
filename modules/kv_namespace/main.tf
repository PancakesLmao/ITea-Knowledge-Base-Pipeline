# Primary resources for Workers KV namespace module

resource "cloudflare_workers_kv_namespace" "this" {
  account_id = var.account_id
  title      = var.title
}
