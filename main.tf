/*
module "Storage-Bucket"{
  source = "./Bucket"
  Bucket-name = "${var.Bucket-name}"
  Region = "${var.Region}"
  Project = "${var.Project}"
  
}

module "Compute"{
  source = "./Compute"
}

module "Network"{
  source = "./Network"
}

*/

/*
resource "google_compute_instance" "vm_instance" {
    name = "simple-vm"
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
*/


/*
resource "google_storage_bucket" "google_storage_bucket-009" {
  name          = "infra-cicd-bucket-jenkins-008"
  location      = "US"
  project       = "hcl2025"
  force_destroy = true

  public_access_prevention = "enforced"
}
*/
