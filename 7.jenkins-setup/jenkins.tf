module "jenkins-terraform-k8s-namespace" {
  source  = "./modules/terraform-k8s-namespace/"
  deployment_namespace  = "jenkins"
}

module "jenkins-terraform-helm" {
  source  = "./modules/terraform-helm/"
  deployment_name         = "jenkins"
  deployment_namespace  = "jenkins"
  deployment_path         = "charts/jenkins/"
  values_yaml = <<EOF
controller:
  adminUser: "${var.jenkins_username}"
  adminPassword: "${var.jenkins_password}"
  ingress:
    enabled: yes
    apiVersion: "extensions/v1beta1"
    annotations:
      kubernetes.io/ingress.class: nginx
      ingress.kubernetes.io/ssl-redirect: "false"
      cert-manager.io/cluster-issuer: letsencrypt-prod
      acme.cert-manager.io/http01-edit-in-place: "true"
    hostName: "jenkins.${var.google_domain_name}"
    tls:
      - secretName: jenkins
        hosts:
          - "jenkins.${var.google_domain_name}"
EOF
}
