provider "google" {
  version = "3.5.0"

  credentials = ${credentials}

  project = "terraform-course-278820"
  region  = "australia-southeast1"
  zone    = "australia-southeast1-c"
}

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
    "australia-southeast1-b/www1",
    "australia-southeast1-b/www2",
    "australia-southeast1-b/www3"
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


terraform {
  backend "gcs" {
    bucket = "terraform-course-zoli"
    prefix = "terraform01"
    credentials = "terraform-key.json"
   }
}
