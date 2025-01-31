resource "kubernetes_deployment" "odoo-deployment" {
  for_each = var.environment
  metadata {
    name =  "${var.odoo.name}-${each.key}"  
    labels = {
      app = var.odoo.labels[0]
    }
  }

  spec {
    replicas = var.odoo.replicas
    selector {
      match_labels = {
        app = var.odoo.labels[0]
      }
    }

    template {
      metadata {
        labels = {
          app = var.odoo.labels[0]
        }
      }
      spec {
        container {
          name  = "${var.odoo.name}-tf"  
          image = var.odoo.image
          port {
            container_port = var.odoo.port
          }
          env {
            name  = "POSTGRES_HOST"
            value = "postgres"
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

resource "kubernetes_service" "odoo" {
  for_each = var.environment
  metadata {
    name = "odoo-${each.key}"
  }
  spec {
    selector = {
      app = var.odoo.labels[0]
    }
    port {
      port        = var.odoo.port
      target_port = var.odoo.port
    }
    type = "LoadBalancer"
  }
}