variable "deployment_name" {
  type        = string
  description = "- (Required) Chart release name."
}
variable "google_domain_name" {}
variable "jenkins_extra_volume" {
    default = "jenkins-extra"
    type = string
    description = "Provide volume name for jenkins"
}