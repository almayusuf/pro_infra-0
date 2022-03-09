module "sonarqube-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "sonarqube"
}

module "sonarqube-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "sonarqube"
  deployment_namespace = "sonarqube"
  deployment_path      = "charts/sonarqube/"
  values_yaml          = <<EOF

ingress:
  enabled: true
  hosts:
    - name: "sonarqube.${var.google_domain_name}"
      path: /
  annotations: 
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/proxy-body-size: "64m"
  ingressClassName: nginx
  tls: 
    - secretName: sonarqube
      hosts:
        - "sonarqube.${var.google_domain_name}"
EOF
}

