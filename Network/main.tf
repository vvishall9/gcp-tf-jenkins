resource "google_compute_network" "vpc_network" {
  project                 = "cloud-factory-gcp-platform"
  name                    = "host-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
} 

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "test-subnet-001"
  ip_cidr_range = "10.2.0.0/28"
  region        = "us-central1"
  project       = "cloud-factory-gcp-platform"
  network       = google_compute_network.vpc_network.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
  depends_on = [ google_compute_network.vpc_network ]
}

