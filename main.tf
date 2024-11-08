resource "google_storage_bucket" "google_storage_bucket-003" {
  name          = "infra-cicd-bucket-jenkins-011"
  location      = "US"
  project       = "dev-gce-test"
  force_destroy = true

  public_access_prevention = "enforced"
}


terraform {
 backend "gcs" {
   bucket = "infra-cicd-bucket-jenkins-011"
   
             
 }
}

/*
resource "google_compute_network" "vpc_network" {
  project                 = "gcp-host"
  name                    = "host-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}
*/
