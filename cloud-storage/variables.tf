variable "project" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "name" {
  description = "The name of the bucket."
  type        = string
}

variable "location" {
  description = "The GCS location."
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "The Storage Class of the new bucket. Supported values include: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  type        = string
  default     = "STANDARD"
}

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects. If false, Terraform will fail to delete buckets which contain objects."
  type        = bool
  default     = false
}

variable "uniform_bucket_level_access" {
  description = "Enables Uniform bucket-level access access to a bucket."
  type        = bool
  default     = true
}

variable "public_access_prevention" {
  description = "Prevents public access to a bucket. Acceptable values are inherited or enforced. If inherited, the bucket uses public access prevention, only if the bucket is subject to the public access prevention organization policy constraint."
  type        = string
  default     = "enforced"
}

variable "labels" {
  description = "A general map of labels to apply to the bucket."
  type        = map(string)
  default     = {}
}

variable "versioning" {
  description = "While set to true, versioning is fully enabled for this bucket."
  type        = any
  default     = null
}

variable "website" {
  description = "Map of website configuration properties."
  type        = any
  default     = null
}

variable "cors" {
  description = "List of CORS configurations."
  type        = any
  default     = []
}

variable "lifecycle_rules" {
  description = "The bucket's Lifecycle Rules configuration."
  type        = any
  default     = []
}

variable "encryption" {
  description = "A map containing the default KMS key name."
  type        = any
  default     = null
}
