resource "google_storage_bucket" "google_storage_bucket-001" {
  name          =  var.Bucket-name
  location      =  var.Region
  project       =  var.Project
  force_destroy = true

  public_access_prevention = "enforced"
}




