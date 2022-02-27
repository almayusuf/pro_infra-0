module "tools-namespace" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "tools"
}

module "dev-namespace" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "dev"
}