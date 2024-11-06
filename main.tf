resource "google_storage_bucket" "google_storage_bucket-002" {
  name          = "infra-cicd-bucket11223344"
  location      = "US"
  project       = "dev-gce-test"
  force_destroy = true

  public_access_prevention = "enforced"
}
