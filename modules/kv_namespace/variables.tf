# Input variable declarations for Workers KV namespace module

variable "account_id" {
  description = "Cloudflare account ID where the KV namespace will be created"
  type        = string
  sensitive   = true
}

variable "title" {
  description = "Title / name of the KV namespace"
  type        = string
}

variable "jurisdiction" {
  description = "Optional jurisdiction for the KV namespace (eu, fedramp, us)"
  type        = string
  default     = null

  validation {
    condition     = var.jurisdiction == null ? true : contains(["eu", "fedramp", "us"], var.jurisdiction)
    error_message = "Jurisdiction must be one of: eu, fedramp, us."
  }
}
