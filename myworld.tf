provider "google" {
  version = "3.5.0"

  credentials = var.mycredentials

  project = "terraform-course-278820"
  region  = "australia-southeast1"
  zone    = "australia-southeast1-c"
}

module "compute-instances" {
  source = "./compute-instances"
}

module "external-nlb"{
  source = "./external-nlb"
}

terraform {
  backend "gcs" {
    bucket = "terraform-course-zoli"
    prefix = "terraform01"
    credentials = "terraform-key.json"
   }
}
