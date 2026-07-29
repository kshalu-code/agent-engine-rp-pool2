resource "google_storage_bucket" "default" {
  name                        = var.name
  project                     = var.project
  location                    = var.location
  storage_class               = var.storage_class
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = var.uniform_bucket_level_access
  public_access_prevention    = var.public_access_prevention
  labels                      = var.labels

  dynamic "versioning" {
    for_each = var.versioning != null ? [var.versioning] : []
    content {
      enabled = versioning.value.enabled
    }
  }

  dynamic "website" {
    for_each = var.website != null ? [var.website] : []
    content {
      main_page_suffix = lookup(website.value, "main_page_suffix", null)
      not_found_page   = lookup(website.value, "not_found_page", null)
    }
  }

  dynamic "cors" {
    for_each = var.cors
    content {
      origin          = lookup(cors.value, "origin", null)
      method          = lookup(cors.value, "method", null)
      response_header = lookup(cors.value, "response_header", null)
      max_age_seconds = lookup(cors.value, "max_age_seconds", null)
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      action {
        type          = lifecycle_rule.value.action.type
        storage_class = lookup(lifecycle_rule.value.action, "storage_class", null)
      }
      condition {
        age                        = lookup(lifecycle_rule.value.condition, "age", null)
        created_before             = lookup(lifecycle_rule.value.condition, "created_before", null)
        with_state                 = lookup(lifecycle_rule.value.condition, "with_state", null)
        matches_storage_class      = lookup(lifecycle_rule.value.condition, "matches_storage_class", null)
        num_newer_versions         = lookup(lifecycle_rule.value.condition, "num_newer_versions", null)
        days_since_custom_time     = lookup(lifecycle_rule.value.condition, "days_since_custom_time", null)
        days_since_noncurrent_time = lookup(lifecycle_rule.value.condition, "days_since_noncurrent_time", null)
      }
    }
  }

  dynamic "encryption" {
    for_each = var.encryption != null ? [var.encryption] : []
    content {
      default_kms_key_name = encryption.value.default_kms_key_name
    }
  }
}
