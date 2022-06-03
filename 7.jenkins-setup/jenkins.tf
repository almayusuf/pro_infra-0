module "jenkins-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "jenkins"
}

module "jenkins-terraform-helm" {
  depends_on = [
    kubernetes_persistent_volume_claim.example,
    module.jenkins-terraform-k8s-namespace
  ]
  source               = "./modules/terraform-helm/"
  deployment_name      = "jenkins"
  deployment_namespace = "jenkins"
  deployment_path      = "charts/jenkins/"
  values_yaml          = <<EOF
controller:
  image: "jenkins/jenkins"
  tag: "${var.tag}"
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
  installPlugins:
    # - configuration-as-code
    # - script-security
    # - monitoring
    # - git
    - kubernetes-credentials:0.9.0
    - bouncycastle-api:2.26
    - kubernetes:3600.v144b_cd192ca_a_
    - command-launcher:84.v4a_97f2027398
    - credentials:1129.vef26f5df883c
    - role-strategy
    - pipeline-groovy-lib    
    
  resources:
    requests:
      cpu: "50m"
      memory: "256Mi"
    limits:
      cpu: "1000m"
      memory: "1024Mi"
  adminUser: "${var.jenkins_user}"
  adminPassword: "${var.jenkins_password}"
persistence:
  existingClaim: "${var.jenkins_extra_volume}"
EOF
}

resource "kubernetes_persistent_volume_claim" "example" {
  metadata {
    name      = var.jenkins_extra_volume
    namespace = "jenkins"
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.storage
      }
    }
    storage_class_name = "standard"
  }
}
output "jenkins_password" {
  value = <<-EOF

                Please run below command 

                    Username: admin

                    Password: Please run below command
                        printf $(kubectl get secret --namespace jenkins jenkins -o jsonpath='{.data.jenkins-admin-password}' | base64 --decode);echo
  EOF
}