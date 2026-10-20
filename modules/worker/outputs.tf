# Output value declarations for Worker module

output "id" {
  description = "Identifier of the created Worker script"
  value       = cloudflare_workers_script.this.id
}

output "name" {
  description = "Name of the created Worker script"
  value       = cloudflare_workers_script.this.script_name
}

output "created_on" {
  description = "Timestamp when the Worker script was created"
  value       = cloudflare_workers_script.this.created_on
}
