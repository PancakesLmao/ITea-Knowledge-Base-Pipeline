# Remote state backend configuration

terraform {
  backend "s3" {
    # bucket                      = null
    # No need to use bucket name here because you can set it during the first `terraform init` along with -backend-config="bucket=your-tfstate-bucket-name"
    key                         = "iteakb/terraform.tfstate"
    region                      = "auto"
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    skip_metadata_api_check     = true
  }
}
