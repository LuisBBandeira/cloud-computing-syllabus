resource "kubernetes_namespace_v1" "my-ns" {
  for_each = toset(var.environment)
  metadata {
    name = each.key
  }
}

resource "kubernetes_deployment_v1" "my-deployment" {
  for_each = toset(var.environment)
  metadata {
    name = "nginx-${each.key}"
    labels = {
      test = "nginx-${each.key}"
    }
    namespace = each.key
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "nginx-${each.key}"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx-${each.key}"
        }
      }

      spec {
        container {
          image = "nginx:alpine"
          name  = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}