# Output value declarations for D1 database module

output "database_id" {
  description = "Unique ID (UUID) of the created D1 database"
  value       = cloudflare_d1_database.this.id
}

output "database_name" {
  description = "Name of the created D1 database"
  value       = cloudflare_d1_database.this.name
}

output "version" {
  description = "Version of the created D1 database"
  value       = cloudflare_d1_database.this.version
}
