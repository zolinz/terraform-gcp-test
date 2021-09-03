
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.82.0"
    }
  }
}

provider "google" {
  credentials = file("zoli-mesh-project-836048260c2a.json")

  project = "zoli-mesh-project"
  region  = "australia-southeast2"
  zone    = "australia-southeast2-b"
}
