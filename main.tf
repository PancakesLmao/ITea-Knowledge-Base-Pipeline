# Primary resources and data sources
module "r2_media" {
  source = "./modules/r2_bucket"

  account_id    = var.cloudflare_account_id
  enable_cors   = false
  location      = "apac"
  name          = "iteakb-media"
  storage_class = "Standard"
}

module "r2_search_corpus" {
  source = "./modules/r2_bucket"

  account_id    = var.cloudflare_account_id
  enable_cors   = false
  location      = "apac"
  name          = "iteakb-search-corpus"
  storage_class = "Standard"
}

module "d1_catalog" {
  source = "./modules/d1_database"

  account_id            = var.cloudflare_account_id
  name                  = "itea-catalog"
  primary_location_hint = "apac"
}

module "kv_session" {
  source = "./modules/kv_namespace"

  account_id = var.cloudflare_account_id
  title      = "iteakb-session"
}