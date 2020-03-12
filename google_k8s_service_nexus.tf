resource "kubernetes_persistent_volume_claim" "nexus_pvc" {
  depends_on = ["kubernetes_namespace.service_tools"]

  metadata {
    name = "nexus-pvc"

    namespace = "${var.deployment_environment}"

    labels {
      app = "nexus-deployment"
    }
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests {
        storage = "30Gi"
      }
    }

    storage_class_name = "standard"
  }
}