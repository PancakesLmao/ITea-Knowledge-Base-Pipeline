# Input variable declarations

variable "cloudflare_account_id" {
  description = "Cloudflare account ID for managing infrastructure resources"
  type        = string
  default     = ""
  sensitive = true
}

variable "tags" {
  description = "Common resource tags applied across infrastructure resources"
  type        = map(string)
  default = {
    application = "application-name"
    created_by  = "terraform"
    environment = "production"
  }
}
