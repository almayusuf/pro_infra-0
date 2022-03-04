module "sonarqube-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "sonarqube"
}

module "sonarqube-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "sonarqube"
  deployment_namespace = "sonarqube"
  deployment_path      = "charts/sonarqube/"
  values_yaml          = ""
}

