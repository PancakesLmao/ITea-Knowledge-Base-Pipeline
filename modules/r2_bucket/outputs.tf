# Output value declarations for R2 bucket module

output "bucket_id" {
  description = "ID of the created R2 bucket"
  value       = cloudflare_r2_bucket.this.id
}

output "bucket_name" {
  description = "Name of the created R2 bucket"
  value       = cloudflare_r2_bucket.this.name
}

output "storage_class" {
  description = "Storage class configured for the R2 bucket"
  value       = cloudflare_r2_bucket.this.storage_class
}
