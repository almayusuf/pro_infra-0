terraform {
  backend "gcs" {
    bucket  = "backend-arkipjmmvbewegll"
    prefix  = "/dev/home/projectfarrukh/project_infrastructure/2.cluster_setup"
  }
}
