resource "google_storage_bucket" "google_storage_bucket-001" {
  name          = "infra-cicd-bucket-jenkins"
  location      = "US"
  project       = "cloud-factory-gcp-platform"
  force_destroy = true

  public_access_prevention = "enforced"
}
resource "google_storage_bucket" "google_storage_bucket-002" {
  name          = "infra-cicd-bucket-jenkins-gcp"
  location      = "US"
  project       = "cloud-factory-gcp-platform"
  force_destroy = true

  public_access_prevention = "enforced"
}



