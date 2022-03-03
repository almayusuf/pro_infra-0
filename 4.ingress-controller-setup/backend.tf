terraform {
  backend "gcs" {
    bucket = "backend-macutzyuygsdwvwp"
    prefix = "/dev/home/projectfarrukh/project_infrastructure/4.ingress-controller-setup"
  }
}
