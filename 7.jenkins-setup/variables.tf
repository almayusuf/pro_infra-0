variable "google_domain_name" {}
variable "jenkins_extra_volume" {
  default     = "jenkins-extra"
  type        = string
  description = "Provide volume name for jenkins"
}

variable "storage" {
  type    = string
  default = "15Gi"
}
variable "tag" {
  type    = string
  default = "2.337-jdk11"
}
variable "jenkins_user" {}
variable "jenkins_password" {}