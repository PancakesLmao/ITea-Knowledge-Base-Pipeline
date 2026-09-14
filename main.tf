# Primary resources and data sources
module "r2_bucket" {
  source = "./modules/r2_bucket"

  account_id    = var.cloudflare_account_id
  enable_cors   = false
  location      = "apac"
  name          = "iteakb-storage"
  storage_class = "Standard"
}
