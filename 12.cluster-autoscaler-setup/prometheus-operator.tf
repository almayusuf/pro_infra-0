module "prometheus-operator-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "prometheus-operator"
}

module "prometheus-operator-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "prometheus-operator"
  deployment_namespace = "prometheus-operator"
  deployment_path      = "charts/prometheus-operator/"
  values_yaml          = <<EOF
EOF
}