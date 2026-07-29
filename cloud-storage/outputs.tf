output "id" {
  description = "The name of the bucket."
  value       = google_storage_bucket.default.id
}

output "name" {
  description = "The name of the bucket."
  value       = google_storage_bucket.default.name
}

output "url" {
  description = "The base URL of the bucket, in the format gs://<bucket-name>."
  value       = google_storage_bucket.default.url
}

output "self_link" {
  description = "The URI of the created resource."
  value       = google_storage_bucket.default.self_link
}

output "project" {
  description = "The ID of the project in which the resource belongs."
  value       = google_storage_bucket.default.project
}

output "location" {
  description = "The location of the bucket."
  value       = google_storage_bucket.default.location
}

output "storage_class" {
  description = "The Storage Class of the new bucket."
  value       = google_storage_bucket.default.storage_class
}

output "bucket" {
  description = "The full google_storage_bucket resource representation."
  value       = google_storage_bucket.default
  sensitive   = true
}
