module "sonatype-nexus-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "sonatype-nexus"
}

module "sonatype-nexus-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "sonatype-nexus"
  deployment_namespace = "sonatype-nexus"
  deployment_path      = "charts/sonatype-nexus/"
  values_yaml          = ""
}

