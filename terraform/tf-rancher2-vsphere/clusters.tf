# Create a new rancher2 RKE Cluster
resource "rancher2_cluster" "vsphere_centos_cluster" {
  name = "vsphere-centos-cluster"
  description = "vSphere Cluster based on CentOS Linux"
  rke_config {
    network {
      plugin = "canal"
    }
  }
}