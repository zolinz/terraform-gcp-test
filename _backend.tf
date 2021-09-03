terraform {
  backend "gcs" {
    bucket = "terraform-state-zoli"
    prefix = "raspernetes-cluster"
    credentials = "zoli-mesh-project-836048260c2a.json"
  }
}
