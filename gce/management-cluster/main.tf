// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("~/.gce/credentials")}"
  project     = "rancher-dev"
  region      = "us-central1"
}

module "gce_database" {
  source = "../../modules/gce/database"

  name = "william-test-db"
  region = "us-central"
  database_tier = "db-n1-standard-1"
  disk_size = 20
  disk_type = "PD_SSD"
}

module "gce_compute" {
  source = "../../modules/gce/compute"

  name = "william-test"
  machine_type = "n1-standard-1"
  zone = "us-central1-f"
  disk_image = "ubuntu-os-cloud/ubuntu-1604-lts"
  server_count = "1"
  compute_count = "1"
  service_account_scopes = []
  database_endpoint = "${module.gce_database.endpoint}"
}




# provider "rancher" {
#   api_url = "{$gce_compute.google_compute_instance.rancher_server.network_interface.0.access_config.0.assigned_nat_ip}"
# }
#
# resource "rancher_environment" "default" {
#   //depends_on = ["gce_compute.google_compute_instance.rancher_server"]
#   name = "env1"
#   description = "The Default environment"
#   orchestration = "cattle"
# }
#
