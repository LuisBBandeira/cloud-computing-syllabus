terraform {
  required_providers {
    minikube = {
      source = "scott-the-programmer/minikube"
      version = "0.4.4"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.35.1"
    }
  }
}

provider "minikube" {
  # Configuration options
}

provider "kubernetes" {
  # Configuration options
  host = minikube_cluster.my-cluster.host
  cluster_ca_certificate = minikube_cluster.my-cluster.cluster_ca_certificate
  client_certificate = minikube_cluster.my-cluster.client_certificate
  client_key = minikube_cluster.my-cluster.client_key
}