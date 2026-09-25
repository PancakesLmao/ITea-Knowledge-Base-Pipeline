# Primary resources for D1 database module

resource "cloudflare_d1_database" "this" {
  account_id            = var.account_id
  name                  = var.name
  primary_location_hint = var.primary_location_hint

  read_replication = {
    mode = var.read_replication_mode
  }
}
