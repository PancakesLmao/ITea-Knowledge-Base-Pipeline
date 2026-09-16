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