variable "loadBalancerSourceRanges" {
  type = list(any)
}
variable "google_domain_name" {
  description = "Please provide your domain name"
  type        = string
}

variable "limit_cpu" {}
variable "limit_memory" {}
variable "request_cpu" {}
variable "request_memory" {}