# Input variable declarations

variable "cloudflare_account_id" {
  description = "Cloudflare account ID for managing infrastructure resources"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Common resource tags applied across infrastructure resources"
  type        = map(string)
  default = {
    application = "itea-knowledge-base"
    created_by  = "terraform"
    environment = "production"
  }
}
