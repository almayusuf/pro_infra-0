provider "helm" {
#     experiments {
#     manifest = true
#   }
# Should be disabled. It is giving an error
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "helm_deployment" {
  name       = "${var.deployment_name}"
  namespace  = "${var.deployment_namespace}"
  chart      = "${var.deployment_path}"

  values = [
    "${var.values_yaml}"
  ]
}

