# Output value declarations for Workers KV namespace module

output "id" {
  description = "ID of the created Workers KV namespace"
  value       = cloudflare_workers_kv_namespace.this.id
}

output "title" {
  description = "Title of the created Workers KV namespace"
  value       = cloudflare_workers_kv_namespace.this.title
}
