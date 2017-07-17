variable "name" {}
variable "machine_type" {}
variable "zone" {}
variable "server_count" {
  default = "1"
}

variable "service_account_scopes" {
  type = "list"
}

variable "instance_metadata" {
  type = "map"
  default = {}
}
variable "instance_zone" {
  default = "us-central1-a"
}

variable "instance_tags"  {
  type = "list"
  default = []
}
variable "database_endpoint" {}

variable "database_name" {}

variable "database_user" {}

variable "database_password" {}