variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
  default     = ""
}

variable "bucket" {
  description = "Google Storage Bucket Name"
  type        = string
  default     = ""
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-central1"
}

variable "dataset" {
  description = "BigQuery Dataset Name"
  type        = string
  default     = "data_ingest"
}

variable "service_name" {
  description = "Service Name"
  type        = string
  default     = "ingest-market-data"
}

variable "service_account_name" {
  description = "Service Account Name"
  type        = string
  default     = "svc-market-ingest"
}

variable "service_account_email" {
  description = "Service Account Email"
  type        = string
  default     = ""
}

