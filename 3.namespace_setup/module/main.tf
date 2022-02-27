provider "kubernetes" {
  config_path    = "~/.kube/config"
}

resource "kubernetes_namespace" "example" {
  metadata {
    annotations = var.annotations
    labels      = var.labels
    name        = var.name
  }
}

variable "annotations" {
  type = map(any)
  default = {
    name = "example-annotation"
  }
}

variable "labels" {
  type = map
  default = {
    name = "example-annotation"
  }
}

variable "name" {
  type    = string
  default = "terraform"
}