resource "kubernetes_namespace_v1" "my-ns" {
  for_each = toset(var.environment)
  metadata {
    name = each.key
  }
}

resource "kubernetes_deployment" "my-deploy" {
    for_each = toset(var.environment)
    metadata {
      name = "${var.deploy.name}-${each.key}"
      namespace = each.key
      labels = {
        app = app.deploy.name
      }
    }

    spec {
      replicas = var.deploy.replicas

      selector {
        match_labels = {
          app = var.deploy.name
        }
      }
      template {
        metadata {
            labels = {
                app = var.deploy.name
            }
        }

        spec {
          container {
            name = var.deploy.containerName
            image = var.deploy.image
            port {
              container_port = var.deploy.port
            }
          }
        }
      }
    }
}