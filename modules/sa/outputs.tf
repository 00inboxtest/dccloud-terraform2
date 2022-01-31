output "email" {
  value       = google_service_account.gce_sa.email
  description = "The URI of the Google Service Account resource."
}

