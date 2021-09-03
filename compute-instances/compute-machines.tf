resource "google_compute_instance" "www1" {
  name         = "www1"
  machine_type = "g1-small"  #var.mytype
  zone         = var.zone

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
    network = var.vpc
    subnetwork = var.subnet
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<EOF
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www1</h1></body></html>' | tee /var/www/html/index.html
    EOF

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_instance" "www2" {
  name         = "www2"
  machine_type = "g1-small"  #var.mytype
  zone         = var.zone

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
    network = var.vpc
    subnetwork = var.subnet
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<EOF
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www2</h1></body></html>' | tee /var/www/html/index.html
    EOF

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_instance" "www3" {
  name         = "www3"
  machine_type = "g1-small"  #var.mytype
  zone         = var.zone

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
    network =  var.vpc
    subnetwork = var.subnet
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<EOF
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www3</h1></body></html>' | tee /var/www/html/index.html
    EOF

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
