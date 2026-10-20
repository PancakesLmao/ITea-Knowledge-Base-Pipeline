# Input variable declarations for Worker module

variable "account_id" {
  description = "Cloudflare account ID where the Worker will be created"
  type        = string
  sensitive   = true
}

variable "name" {
  description = "Name of the Worker script"
  type        = string
}

variable "content" {
  description = "Initial JavaScript/TypeScript content of the Worker script. Defaults to minimal placeholder handler."
  type        = string
  default     = "export default { fetch() { return new Response(\"Worker initialized\"); } };"
}

variable "compatibility_date" {
  description = "Date defining the Workers runtime behavior (YYYY-MM-DD)"
  type        = string
  default     = null
}

variable "compatibility_flags" {
  description = "List of compatibility flags to enable for the Worker"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to help organize and filter Workers scripts"
  type        = list(string)
  default     = []
}
