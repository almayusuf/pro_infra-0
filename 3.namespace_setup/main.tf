module "tools" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "tools"
}

module "dev" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "dev"
}

module "cert-manager" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "cert-manager"
}

module "external-dns" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "external-dns"
}

module "grafana" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "grafana"
} 