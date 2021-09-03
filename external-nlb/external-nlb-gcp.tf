resource "google_compute_address" "static_ip" {
  name = "my-lb-static-ip"
}

resource "google_compute_http_health_check" "hc" {
  name               = "my-hc"
  request_path       = "/"
  host               = google_compute_address.static_ip.address
  port               = 80
  timeout_sec        = 1
  check_interval_sec = 1
}


data "google_compute_instance" "www1" {
  name  = "www1"
}

resource "google_compute_target_pool" "my-lb-pool"{
  name = "my-lb-instances-pool"
  instances = [
    "australia-southeast2-b/www1",
    "australia-southeast2-b/www2",
    "australia-southeast2-b/www3"
  ]


  health_checks = [
    google_compute_http_health_check.hc.name,
  ]
}


resource "google_compute_forwarding_rule" "default" {
  name       = "my-lb-forwarding-rule"
  target     = google_compute_target_pool.my-lb-pool.self_link
  ip_address = google_compute_address.static_ip.address
  port_range = 80
}

resource "google_compute_firewall" "mesh-poc-lb" {
  name    = "test-firewall"
  network = var.vpc
  #subnetwork = var.subnet


  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["network-lb-tag"]
}
