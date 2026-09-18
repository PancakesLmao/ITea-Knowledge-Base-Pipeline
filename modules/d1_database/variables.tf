# Input variable declarations for D1 database module

variable "account_id" {
  description = "Cloudflare account ID where the D1 database will be created"
  type        = string
  sensitive   = true
}

variable "name" {
  description = "Name of the D1 database"
  type        = string
}

variable "primary_location_hint" {
  description = "Geographic placement hint for the database engine (apac, eeur, enam, weur, wnam, oc). Null defaults to automatic placement matching Cloudflare UI default."
  type        = string
  default     = null

  validation {
    condition     = var.primary_location_hint == null ? true : contains(["apac", "eeur", "enam", "weur", "wnam", "oc"], var.primary_location_hint)
    error_message = "Primary location hint must be one of: apac, eeur, enam, weur, wnam, oc."
  }
}
