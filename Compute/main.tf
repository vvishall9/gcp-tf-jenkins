resource "google_compute_instance" "vm_instance" {
    name = "simple-vm-01"
    machine_type = "e2-micro"
    zone = "us-central1-a"
    project  = "cloud-factory-gcp-platform"

boot_disk {
    initialize_params {
        image = "debian-cloud/debian-11"
        }
    }

network_interface {
    network = "gcp-vpc"
    subnetwork = "subnet1"
    
    access_config {
// Ephemeral public IP
   }
 }
}
