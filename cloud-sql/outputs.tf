output "self_link" {
  description = "The URI of the created resource."
  value       = google_sql_database_instance.default.self_link
}

output "id" {
  description = "An identifier for the resource with format projects/{{project}}/instances/{{name}}."
  value       = google_sql_database_instance.default.id
}

output "name" {
  description = "The name of the database instance."
  value       = google_sql_database_instance.default.name
}

output "connection_name" {
  description = "The connection name of the instance to be used in connection strings."
  value       = google_sql_database_instance.default.connection_name
}

output "public_ip_address" {
  description = "The first public (PRIMARY) IPv4 address assigned."
  value       = google_sql_database_instance.default.public_ip_address
}

output "private_ip_address" {
  description = "The first private (PRIVATE) IPv4 address assigned."
  value       = google_sql_database_instance.default.private_ip_address
}

output "service_account_email_address" {
  description = "The service account email address assigned to the instance."
  value       = google_sql_database_instance.default.service_account_email_address
}

output "instance" {
  description = "The full google_sql_database_instance representation for access to all properties."
  value       = google_sql_database_instance.default
  sensitive   = true
}
