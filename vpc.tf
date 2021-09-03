resource "google_compute_network" "mesh_vpc_network" {
  name                    = "mesh-network"
}

resource "google_compute_subnetwork" "mesh_subnet" {
  name          = "mesh-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region  = "australia-southeast2"
  network       = google_compute_network.mesh_vpc_network.id


}
