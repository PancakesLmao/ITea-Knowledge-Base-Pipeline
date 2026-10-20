# Primary resources for Worker module

resource "cloudflare_workers_script" "this" {
  account_id          = var.account_id
  script_name         = var.name
  content             = var.content
  compatibility_date  = var.compatibility_date
  compatibility_flags = var.compatibility_flags
}
