terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  =  var.region
  credentials = file("./config/account.json")
}

resource "google_service_account" "ingest_service_account" {
    account_id = var.service_account_name
    display_name = "Market data ingest"
    description = "Description of the market data ingest"
}

resource "google_service_account_key" "account_credentials" {
  service_account_id = var.service_account_name
  private_key_type = "json"
}

resource "google_storage_bucket" "ingest_bucket" {
  name = var.bucket
  location = var.region
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "s_bucket_admin" {
    bucket = var.bucket    
    role = "roles/storage.admin"
    members = [
        "serviceAccount:${var.service_account_email}"
    ]
}

resource "google_bigquery_dataset" "ingest_dataset" {
  dataset_id = var.dataset
  project = var.project_id
}

resource "google_project_iam_binding" "bq_data_owner_binding" {
  project = var.project_id

  role   = "roles/bigquery.dataOwner"
  members = [
    "serviceAccount:${var.service_account_email}"
  ]
}

resource "google_project_iam_binding" "bq_job_user_binding" {
  project = var.project_id

  role   = "roles/bigquery.jobUser"
  members = [
    "serviceAccount:${var.service_account_email}"
  ]
}


