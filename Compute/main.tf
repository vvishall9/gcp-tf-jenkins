resource "google_compute_instance" "vm_instance" {
    name = "simple-vm"
    machine_type = "e2-micro"
    zone = "asia-south1-c"

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
