output "k8s_information" {
  value = <<-EOF
  ################################################################################################################################################
  ################################################################################################################################################
  ################################################################################################################################################

${module.gke.k8s_information}

  ################################################################################################################################################
  ################################################################################################################################################
  ################################################################################################################################################
    EOF
}