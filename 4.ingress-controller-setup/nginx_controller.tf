module "nginx_controller" {
  source = "./module"
  nginx_ingress = {
    name         = "nginx-ingress-controller"
    repository   = "https://charts.bitnami.com/bitnami"
    chart        = "nginx-ingress-controller"
    service_type = "service.type"
    value        = "LoadBalancer"
    version      = "9.1.9"
    namespace    = "default"
  }
}

