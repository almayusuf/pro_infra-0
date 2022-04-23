variable "loadBalancerSourceRanges" {
  type = list(any)
}
variable "google_domain_name" {
  description = "Please provide your domain name"
  type        = string
}