resource "google_storage_bucket" "google_storage_bucket-003" {
  name          = "infra-cicd-bucket-jenkins-001"
  location      = "US"
  project       = "dev-gce-test"
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_compute_network" "vpc_network" {
  project                 = "dev-gce-test"
  name                    = "host-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
} 
resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "test-subnet-001"
  ip_cidr_range = "10.2.0.0/28"
  region        = "us-central1"
  project       = "dev-gce-test"
  network       = google_compute_network.vpc_network.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
  depends_on = [ google_compute_network.vpc_network ]
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges-001" {
  name          = "test-subnet-002"
  ip_cidr_range = "10.1.0.0/28"
  region        = "us-east1"
  project       = "dev-gce-test"
  network       = google_compute_network.vpc_network.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update2"
    ip_cidr_range = "192.167.10.0/24"
  }
  depends_on = [ google_compute_network.vpc_network ]
}


# Creating Virtual Machine

resource "google_compute_instance" "default" {
  name         = "dev-test-001"
  project       = "dev-gce-test"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  
  network_interface {
    network = "host-vpc"
    subnetwork = google_compute_subnetwork.network-with-private-secondary-ip-ranges.id

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email = "gcp-jenkins@dev-gce-test.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}

/*
resource "google_compute_shared_vpc_host_project" "host" {
  project = "dev-gce-test"
}

resource "google_compute_shared_vpc_service_project" "service1" {
  host_project    = google_compute_shared_vpc_host_project.host.project
  service_project = "gcp-service-project-441110"
}*/
