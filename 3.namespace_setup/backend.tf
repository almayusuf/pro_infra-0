terraform {
  backend "gcs" {
    bucket  = "backend-arkipjmmvbewegll"
    prefix  = "/dev/home/projectfarrukh/project_infrastructure/3.namespace_setup"
  }
}
