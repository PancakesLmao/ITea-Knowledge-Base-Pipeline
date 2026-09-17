# Input variable declarations for R2 bucket module

variable "account_id" {
  description = "Cloudflare account ID where the R2 bucket will be created"
  type        = string
  sensitive = true
}

variable "cors_rules" {
  description = "Custom CORS rules for the R2 bucket. If null and enable_cors is true, the module's default CORS rules are applied."
  type = list(object({
    id              = optional(string)
    max_age_seconds = optional(number)
    expose_headers  = optional(list(string), [])
    allowed = object({
      methods = list(string)
      origins = list(string)
      headers = optional(list(string), [])
    })
  }))
  default = null
}

variable "enable_cors" {
  description = "Whether to configure CORS rules on the R2 bucket"
  type        = bool
  default     = true
}

variable "jurisdiction" {
  description = "Jurisdiction where objects in this bucket are guaranteed to be stored (default, eu, fedramp, fedramp-high, us)"
  type        = string
  default     = null

  validation {
    condition     = var.jurisdiction == null ? true : contains(["default", "eu", "fedramp", "fedramp-high", "us"], var.jurisdiction)
    error_message = "Jurisdiction must be one of: default, eu, fedramp, fedramp-high, us."
  }
}

variable "location" {
  description = "Geographic placement hint for bucket storage (apac, eeur, enam, weur, wnam, oc)"
  type        = string
  default     = null

  validation {
    condition     = var.location == null ? true : contains(["apac", "eeur", "enam", "weur", "wnam", "oc"], var.location)
    error_message = "Location must be one of: apac, eeur, enam, weur, wnam, oc."
  }
}

variable "name" {
  description = "Name of the R2 bucket"
  type        = string
}

variable "storage_class" {
  description = "Storage class for the R2 bucket (Standard or InfrequentAccess)"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "InfrequentAccess"], var.storage_class)
    error_message = "Storage class must be either 'Standard' or 'InfrequentAccess'."
  }
}
