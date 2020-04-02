# Create a new rancher2 Node Pool
resource "rancher2_node_pool" "vSphere_np" {
  cluster_id =  rancher2_cluster.vsphere_oel_cluster.id
  name = "vsphere-node-pool"
  hostname_prefix =  "conti-demo-oel-7.6-"
  node_template_id = rancher2_node_template.vsphere_nt.id
  quantity = 3
  control_plane = true
  etcd = true
  worker = false
}