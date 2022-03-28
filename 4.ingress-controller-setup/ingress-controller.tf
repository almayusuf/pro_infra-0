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
      - "104.181.144.186/32"   # Evolve Cyber Office
      - "72.68.108.222/32"     # Maksat Sadyrov
      - "73.74.242.241/32"     # Azizbek 
      - "99.7.19.155/32"       # DJ
      - "104.57.11.55/32"      # Suheda
      - "73.8.110.80/32"       # Beibars
      - "147.219.244.131/32"   # Altai
      - "104.185.25.250/32"   # Anastasia
      - "0.0.0.0/0"
      - "98.253.225.168/32"
  EOF
}

