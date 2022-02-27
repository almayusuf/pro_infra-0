output k8s_information {
    value = <<-EOF
${google_container_cluster.primary.name}
${google_container_node_pool.primary_preemptible_nodes.name}
    EOF
}