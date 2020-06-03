resource "google_compute_instance" "default" {
  name         = "www4"
  machine_type = "g1-small"
  zone         = "australia-southeast1-b"

  tags = ["network-lb-tag"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  #scratch_disk {
  #  interface = "SCSI"
  #}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<EOF
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www4</h1></body></html>' | tee /var/www/html/index.html"
    EOF

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}