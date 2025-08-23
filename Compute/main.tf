resource "google_compute_instance" "vm_instance" {
    name = "simple-vm-01"
    machine_type = "e2-micro"
    zone = "asia-south1-c"
    project  = "cloud-factory-gcp-platform"

boot_disk {
    initialize_params {
        image = "debian-cloud/debian-11"
        }
    }

network_interface {
    network = "gcp-vpc"
    
    access_config {
// Ephemeral public IP
   }
 }
}
