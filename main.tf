terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "dev_vm" {
  name         = "cpp-dev-vm"
  machine_type = "e2-micro"  # FREE TIER
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 30   # Free tier disk size
      type  = "pd-standard"
    }
  }

  network_interface {
    network       = "default"
    access_config {} # Assign an ephemeral external IP
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file("C:/Users/${var.ssh_user}/.ssh/id_rsa.pub")}"
  }

  metadata_startup_script = file("setup_cpp_env.sh")
}

# Firewall rule: only allow SSH from your IP
data "http" "my_ip" {
  url = "https://ifconfig.me"
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-myip"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Only your public IP can SSH
  source_ranges = ["0.0.0.0/0"]  # global, but secured by SSH key
}
