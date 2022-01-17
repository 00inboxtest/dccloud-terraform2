


output "email" {
  value       = google_service_account.gce_sa.email
  description = "The URI of the Google Service Account resource."
}

output "sa_id" {
  value       = local.sa_id
  description = "Display Name of created Google Service Account"
}

output "region" {
  value       = data.google_client_config.google_client.region
  description = "GCP Region in which GCE VM Instance being created"
}
