resource "kubernetes_deployment" "odoo-deployment" {
    metadata {
       name = var.odoo.name
       labels = {
        app = var.odoo.labels
       }
    }

    spec {
      replicas = var.odoo.replicas
      selector {
        match_labels = {
          app = var.odoo.labels
        }
      }

      template {
        metadata {
          labels = {
            app = var.odoo.labels
          }
        }
        spec {
          container {
            name = var.odoo.name
            image = var.odoo.image
          port {
            container_port = var.odoo.port
          }
          }
        }
      }
    }
}