resource "google_compute_instance" "vm_instance" {
    name = "simple-vm"
    machine_type = "e2-micro"
    zone = "us-central1-a"
    project  = "cloud-factory-gcp-platform"

boot_disk {
    initialize_params {
        image = "debian-cloud/debian-11"
        }
    }

network_interface {
    network = "projects/cloud-factory-gcp-platform/global/networks/gcp-vpc"
    subnetwork = "projects/cloud-factory-gcp-platform/regions/us-central1/subnetworks/subnet1"
    
    access_config {
// Ephemeral public IP
   }
 }
}


