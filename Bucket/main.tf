resource "google_storage_bucket" "google_storage_bucket-088" {
  name          = "infra-cicd-bucket-jenkins-003"
  location      = "US"
  project       = "hcl2025"
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_storage_bucket" "google_storage_bucket-089" {
  name          = "infra-cicd-bucket-jenkins-097"
  location      = "US"
  project       = "hcl2025"
  force_destroy = true

  public_access_prevention = "enforced"
}

