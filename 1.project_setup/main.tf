module "account_setup" {
  source = "./module"
  account_setup = {
    billing_account_name = "project"
    project_name         = "testproject2"
    bucket_name          = "backend"
  }
}