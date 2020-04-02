# Create a new rancher2 RKE Cluster
resource "rancher2_cluster" "vsphere_oel_cluster" {
  name = "vsphere-oel-cluster"
  description = "vSphere Cluster based on Oracle Enterprise Linux"
  rke_config {
    network {
      plugin = "canal"
    }
  }
}