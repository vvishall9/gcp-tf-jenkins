
resource "google_compute_network" "vpc_network" {
  project                 = "gcp-host-441110"
  name                    = "host-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
} 

