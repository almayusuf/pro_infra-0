terraform {
  backend "gcs" {
    bucket = "backend-ccynorphpzoxlhyr"
    prefix = "/dev/home/projectfarrukh/project_infrastructure/4.ingress-controller-setup"
  }
}
