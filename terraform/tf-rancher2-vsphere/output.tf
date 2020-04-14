output "node_command" {
    value = "${rancher2_cluster.vsphere_oel_cluster.cluster_registration_token.0.node_command}"
}