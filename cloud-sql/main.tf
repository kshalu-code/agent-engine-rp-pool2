resource "google_sql_database_instance" "default" {
  name                 = var.name
  project              = var.project
  region               = var.region
  database_version     = var.database_version
  
  master_instance_name = var.master_instance_name
  deletion_protection  = var.deletion_protection
  root_password        = var.root_password
  
  # Dynamic settings block handles sub-blocks dynamically using any
  dynamic "settings" {
    for_each = [var.settings]
    content {
      tier                  = settings.value.tier
      activation_policy     = lookup(settings.value, "activation_policy", null)
      availability_type     = lookup(settings.value, "availability_type", null)
      collation             = lookup(settings.value, "collation", null)
      disk_autoresize       = lookup(settings.value, "disk_autoresize", true)
      disk_autoresize_limit = lookup(settings.value, "disk_autoresize_limit", 0)
      disk_size             = lookup(settings.value, "disk_size", null)
      disk_type             = lookup(settings.value, "disk_type", null)
      pricing_plan          = lookup(settings.value, "pricing_plan", "PER_USE")
      user_labels           = lookup(settings.value, "user_labels", {})
      
      dynamic "database_flags" {
        for_each = lookup(settings.value, "database_flags", [])
        content {
          name  = database_flags.value.name
          value = database_flags.value.value
        }
      }
      
      dynamic "backup_configuration" {
        for_each = lookup(settings.value, "backup_configuration", [])
        content {
          binary_log_enabled             = lookup(backup_configuration.value, "binary_log_enabled", null)
          enabled                        = lookup(backup_configuration.value, "enabled", null)
          start_time                     = lookup(backup_configuration.value, "start_time", null)
          location                       = lookup(backup_configuration.value, "location", null)
          point_in_time_recovery_enabled = lookup(backup_configuration.value, "point_in_time_recovery_enabled", null)
          transaction_log_retention_days = lookup(backup_configuration.value, "transaction_log_retention_days", null)
        }
      }
      
      dynamic "ip_configuration" {
        for_each = lookup(settings.value, "ip_configuration", [])
        content {
          ipv4_enabled                                  = lookup(ip_configuration.value, "ipv4_enabled", null)
          private_network                               = lookup(ip_configuration.value, "private_network", null)
          require_ssl                                   = lookup(ip_configuration.value, "require_ssl", null)
          allocated_ip_range                            = lookup(ip_configuration.value, "allocated_ip_range", null)
          enable_private_path_for_google_cloud_services = lookup(ip_configuration.value, "enable_private_path_for_google_cloud_services", null)
          
          dynamic "authorized_networks" {
            for_each = lookup(ip_configuration.value, "authorized_networks", [])
            content {
              expiration_time = lookup(authorized_networks.value, "expiration_time", null)
              name            = lookup(authorized_networks.value, "name", null)
              value           = lookup(authorized_networks.value, "value", null)
            }
          }
        }
      }
      
      dynamic "location_preference" {
        for_each = lookup(settings.value, "location_preference", [])
        content {
          zone = lookup(location_preference.value, "zone", null)
        }
      }
      
      dynamic "maintenance_window" {
        for_each = lookup(settings.value, "maintenance_window", [])
        content {
          day          = lookup(maintenance_window.value, "day", null)
          hour         = lookup(maintenance_window.value, "hour", null)
          update_track = lookup(maintenance_window.value, "update_track", null)
        }
      }
    }
  }
}
