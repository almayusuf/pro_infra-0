terraform {
  backend "gcs" {
    bucket = "backend-ccynorphpzoxlhyr"
    prefix = "/dev/home/projectfarrukh/project_infrastructure/3.namespace_setup"
  }
}
