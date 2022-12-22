# Provider
provider "google" {
  project     = var.project
  region      = var.region
  credentials = var.auth
}

# Create GKE cluster
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  project = var.project
  enable_shielded_nodes = true

  #Define o cluster como privado
  private_cluster_config {
    enable_private_nodes = true
    enable_private_endpoint = false
    master_ipv4_cidr_block = var.master_network_range
  }

  #Define quem pode acessar os masters do cluster através do kubectl
  master_authorized_networks_config {
    cidr_blocks {
        cidr_block = var.meu_ip
        display_name = var.meu_ip_desc
      }
    cidr_blocks {
        cidr_block = var.meu_ip2
        display_name = var.meu_ip_desc2
      }
  }

  #Remove o node pool default
  remove_default_node_pool = true
  initial_node_count       = 1

  #VPC e Subnet onde o cluster será criado
  network    = var.vpc_name
  subnetwork = var.subnet_name

  #Define o range de ips das pods e dos services
  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.cluster_ip_range
    services_ipv4_cidr_block = var.service_ip_range
  }

  #Labels que serão colocadas em todos recursos criados pelo cluster  
  resource_labels = {
    ambiente = var.label_ambiente,
    cliente = var.label_cliente
  }
}

# Create Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  project    = var.project
  location   = var.region
  cluster    = google_container_cluster.primary.name
  initial_node_count = var.gke_num_nodes

  node_config {
    preemptible  = var.preemptible
    machine_type = var.machine_type
    tags = [var.network_tag]
    metadata = {
      disable-legacy-endpoints = "true"
    }
#    oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#      "https://www.googleapis.com/auth/logging.write",
#      "https://www.googleapis.com/auth/monitoring",
#    ]
    labels = {
      ambiente = var.label_ambiente,
      cliente = var.label_cliente
    }
  }
}
