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
