variable "project" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable "name" {
  description = "The name of the instance. If the name is left blank, Terraform will randomly generate one when the instance is first created."
  type        = string
}

variable "region" {
  description = "The region the instance will sit in."
  type        = string
  default     = "us-central1"
}

variable "database_version" {
  description = "The MySQL, PostgreSQL or SQL Server version to use."
  type        = string
  default     = "POSTGRES_15"
}

variable "master_instance_name" {
  description = "The name of the existing instance that will act as the master in the replication setup."
  type        = string
  default     = null
}

variable "deletion_protection" {
  description = "Whether or not to allow Terraform to destroy the instance."
  type        = bool
  default     = true
}

variable "root_password" {
  description = "Initial root password. Required for MS SQL Server."
  type        = string
  default     = null
  sensitive   = true
}

variable "settings" {
  description = "The settings config block representing the arguments to be passed directly to the instance."
  type        = any
  default     = {
    tier = "db-f1-micro"
  }
}
