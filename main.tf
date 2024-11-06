resource "google_storage_bucket" "google_storage_bucket-003" {
  name          = "infra-cicd-bucket-jenkins"
  location      = "US"
  project       = "dev-gce-test"
  force_destroy = true

  public_access_prevention = "enforced"
}
