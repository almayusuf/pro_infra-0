terraform {
  backend "gcs" {
    bucket = "backend-ccynorphpzoxlhyr"
    prefix = "/dev/home/projectfarrukh/project_infrastructure/2.cluster_setup"
  }
}
