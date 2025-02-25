resource "kubernetes_deployment" "postgres" {
  for_each = var.environment
  metadata {
    name = "postgres-${each.key}"
    labels = {
      app = "postgres"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "postgres"
      }
    }

    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }

      spec {
        container {
          name  = "postgres"
          image = "postgres:13"
          port {
            container_port = 5432
          }

          env {
            name  = "POSTGRES_DB"
            value = "odoo"
          }

          env {
            name  = "POSTGRES_USER"
            value = "odoo"
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres.password 
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "postgres" {
  for_each = var.environment
  metadata {
    name = "postgres-${each.key}"
  }
  spec {
    selector = {
      app = "postgres"
    }
    port {
      port = 5432
      target_port = 5432
    }
    type = "ClusterIP"
  }
}
