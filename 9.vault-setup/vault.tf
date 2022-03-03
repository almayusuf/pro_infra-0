module "vault-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "vault"
}

module "vault-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "vault"
  deployment_namespace = "vault"
  deployment_path      = "charts/vault/"
  values_yaml          = ""
}

