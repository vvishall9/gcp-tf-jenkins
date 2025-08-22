resource "google_compute_instance" "vm_instance" {
    name = "simple-vm-01"
    machine_type = "e2-micro"
    zone = "asia-south1-c"
    project  = "hcl2025"

boot_disk {
    initialize_params {
        image = "debian-cloud/debian-11"
        }
    }

network_interface {
    network = "default"
    
    access_config {
// Ephemeral public IP
   }
 }
}
