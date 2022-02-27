provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx_ingress" {
  name       = var.nginx_ingress["name"]
  version    = var.nginx_ingress["version"]
  repository = var.nginx_ingress["repository"]
  chart      = var.nginx_ingress["chart"]
  set {
    name  = var.nginx_ingress["service_type"]
    value = var.nginx_ingress["value"]
  }
}

variable "nginx_ingress" {
  type = map(any)
  default = {
    name         = "nginx-ingress-controller"
    repository   = "https://charts.bitnami.com/bitnami"
    chart        = "nginx-ingress-controller"
    service_type = "service.type"
    value        = "ClusterIP"
    version      = "9.1.9"
  }
}