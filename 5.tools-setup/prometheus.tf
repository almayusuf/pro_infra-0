module "prometheus-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "prometheus"
}

module "prometheus-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "prometheus"
  deployment_namespace = "prometheus"
  deployment_path      = "charts/prometheus/"
  values_yaml          = ""
}

