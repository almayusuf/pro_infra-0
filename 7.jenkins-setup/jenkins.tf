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
    - kubernetes-credentials:0.9.0
    - kubernetes-client-api:5.12.2-193.v26a_6078f65a_9    
    - bouncycastle-api:2.25
    - kubernetes:3600.v144b_cd192ca_a_
    - command-launcher:84.v4a_97f2027398
    - credentials:1129.vef26f5df883c
    - role-strategy:488.v0634ce149b_8c
    - pipeline-groovy-lib    
    - apache-httpcomponents-client-4-api:4.5.13-1.0
    - credentials-binding:523.vd859a_4b_122e6
    - durable-task:496.va67c6f9eefa7
    - jackson2-api
    - javax-activation-api:1.2.0-3
    - javax-mail-api:1.6.2-6
    - jdk-tool:1.5
    - snakeyaml-api:1.30.1
    - ssh-credentials:277.v95c2fec1c047
    - trilead-api:1.57.v6e90e07157e1
    - sshd:3.237.v883d165a_c1d3
    - jaxb:2.3.6-1
    - metrics:4.1.6.2
    - workflow-job:1186.v8def1a_5f3944                 # provides pipeline
    - workflow-multibranch:716.vc692a_e52371b_         # provides multibranch
    - workflow-aggregator:581.v0c46fa_697ffd           # provides scripted pipeline
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