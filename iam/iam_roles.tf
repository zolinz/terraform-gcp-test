terraform {
  backend "gcs" {
    bucket = "terraform-state-zoli"
    prefix = "terraform-iam"
    credentials = "../zoli-mesh-project-836048260c2a.json"
  }
}


provider "google" {
  credentials = file("../zoli-mesh-project-836048260c2a.json")
  project = "zoli-mesh-project"
  #region  = "australia-southeast1"
}

resource "google_project_iam_member" "gke_admin" {
  project = "zoli-mesh-project"
  role    = "roles/container.admin"
  member = "group:gcp_kube_admin@googlegroups.com"
}


//resource "google_project_iam_binding" "project" {
//  project = "zoli-mesh-project"
//  role    = "roles/container.admin"
//  members = [
//    "group:gcp_kube_admin@googlegroups.com",
//  ]
//}
