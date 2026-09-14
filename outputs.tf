# Output value declarations
output "r2_bucket_id" {
  description = "ID of the deployed primary R2 storage bucket"
  value       = module.r2_bucket.bucket_id
}

output "r2_bucket_name" {
  description = "Name of the deployed primary R2 storage bucket"
  value       = module.r2_bucket.bucket_name
}

output "r2_bucket_storage_class" {
  description = "Storage class of the deployed primary R2 storage bucket"
  value       = module.r2_bucket.storage_class
}
