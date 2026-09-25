# Output value declarations for D1 catalog database
output "d1_catalog_database_id" {
  description = "ID of the catalog D1 database"
  value       = module.d1_catalog.database_id
}

output "d1_catalog_database_name" {
  description = "Name of the catalog D1 database"
  value       = module.d1_catalog.database_name
}

# Output value declarations for R2 media bucket
output "r2_media_bucket_id" {
  description = "ID of the media R2 storage bucket"
  value       = module.r2_media.bucket_id
}

output "r2_media_bucket_name" {
  description = "Name of the media R2 storage bucket"
  value       = module.r2_media.bucket_name
}

output "r2_media_bucket_storage_class" {
  description = "Storage class of the media R2 storage bucket"
  value       = module.r2_media.storage_class
}

# Output value declarations for R2 search corpus bucket
output "r2_search_corpus_bucket_id" {
  description = "ID of the search corpus R2 storage bucket"
  value       = module.r2_search_corpus.bucket_id
}

output "r2_search_corpus_bucket_name" {
  description = "Name of the search corpus R2 storage bucket"
  value       = module.r2_search_corpus.bucket_name
}

output "r2_search_corpus_bucket_storage_class" {
  description = "Storage class of the search corpus R2 storage bucket"
  value       = module.r2_search_corpus.storage_class
}

# Output value declarations for KV session namespace
output "kv_session_id" {
  description = "ID of the session Workers KV namespace"
  value       = module.kv_session.id
}

output "kv_session_title" {
  description = "Title of the session Workers KV namespace"
  value       = module.kv_session.title
}

