module "ingress-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "ingress"
}

module "ingress-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "ingress"
  deployment_namespace = "ingress"
  deployment_path      = "charts/nginx-ingress/"
  values_yaml          = <<EOF
controller:
  service:
    create: true
    type: LoadBalancer
    loadBalancerSourceRanges: 
    - "104.181.144.186/32"
    - "127.0.0.1/24"
  EOF
}

