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