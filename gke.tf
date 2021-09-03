
module "compute-instances" {
  source = "./compute-instances"
  #var.mytyep = small
  vpc = google_compute_network.mesh_vpc_network.name
  subnet = google_compute_subnetwork.mesh_subnet.name
}

module "external-nlb"{
  source = "./external-nlb"
  vpc = google_compute_network.mesh_vpc_network.name
  subnet = google_compute_subnetwork.mesh_subnet.name
}
