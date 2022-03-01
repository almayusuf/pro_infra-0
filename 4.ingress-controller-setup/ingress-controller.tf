module "ingress-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "ingress"
}

module "ingress-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "ingress"
  deployment_namespace = "ingress"
  deployment_path      = "charts/nginx-ingress/"
  values_yaml          = ""
}

