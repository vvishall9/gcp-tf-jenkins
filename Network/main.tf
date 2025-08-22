resource "google_compute_network" "vpc_network" {
  project                 = "hcl2025"
  name                    = "host-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
} 