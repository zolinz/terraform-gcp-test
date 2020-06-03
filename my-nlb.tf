provider "google" {
  version = "3.5.0"

  credentials = var.mycredentials

  project = "terraform-course-278820"
  region  = "australia-southeast1"
  zone    = "australia-southeast1-c"
}

module "external_nlb"{
  source = "./external_nlb"
}

terraform {
  backend "gcs" {
    bucket = "terraform-course-zoli"
    prefix = "terraform01"
    credentials = "terraform-key.json"
   }
}
