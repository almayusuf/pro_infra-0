terraform {
  backend "gcs" {
    bucket = "backend-arkipjmmvbewegll"
    prefix = "/dev/home/projectfarrukh/project_infrastructure/4.ingress-controller-setup"
  }
}