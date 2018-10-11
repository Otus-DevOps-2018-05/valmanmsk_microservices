provider "google" {
  version = "1.19.0"
  project = "docker-211312"
  region = "us-central1"
}
resource "google_container_cluster" "primary" {
  name               = "cluster-2"
  zone               = "us-central1-a"
  initial_node_count = 2

  master_auth {
    username = ""
    password = ""
  }

  node_config {
    machine_type = "g1-small"
    disk_size_gb = "20"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
  addons_config {
    kubernetes_dashboard {
      disabled = false
    }
  }
}

