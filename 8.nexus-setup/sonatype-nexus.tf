module "sonatype-nexus-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "sonatype-nexus"
}

module "sonatype-nexus-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "sonatype-nexus"
  deployment_namespace = "sonatype-nexus"
  deployment_path      = "charts/sonatype-nexus/"
  values_yaml          = <<EOF
nexus:
  docker:
    enabled: true
    registries:
      - host: "docker.${var.google_domain_name}"
        port: 8085
        secretName: docker-tls
    annotations:
        nginx.ingress.kubernetes.io/proxy-body-size: "0"
        kubernetes.io/ingress.class: nginx
        ingress.kubernetes.io/ssl-redirect: "false"
        cert-manager.io/cluster-issuer: letsencrypt-prod
        acme.cert-manager.io/http01-edit-in-place: "true"
ingress:
  enabled: true
  annotations:
    nginx.ingress.kubernetes.io/proxy-body-size: "0"
    kubernetes.io/ingress.class: nginx
    ingress.kubernetes.io/ssl-redirect: "false"
    cert-manager.io/cluster-issuer: letsencrypt-prod
    acme.cert-manager.io/http01-edit-in-place: "true"
  hostPath: /
  hostRepo: nexus.${var.google_domain_name}
  tls:
    - secretName: nexus-local-tls
      hosts:
        - nexus.${var.google_domain_name}

  resources:
  # minimum recommended memory settings for a small, person instance from
  # https://help.sonatype.com/repomanager3/product-information/system-requirements
    requests:
      limits:
        cpu: "${var.limit_cpu}"
        memory: "${var.limit_memory}"
      requests:
        cpu: "${var.request_cpu}"
        memory: "${var.request_memory}"
      
persistence:
  enabled: true
  accessMode: ReadWriteOnce
  storageSize: "${var.storageSize}"
EOF
}

output "sonatype_admin_password" {
  value = <<EOF
        Find the pod in sonatype-nexus namespace and login to it. And run 
        cat /nexus-data/admin.password 
EOF
}

variable "limit_cpu" {}
variable "limit_memory" {}
variable "request_cpu" {}
variable "request_memory" {}