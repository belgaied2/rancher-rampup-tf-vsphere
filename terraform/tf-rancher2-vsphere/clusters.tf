# Create a new rancher2 RKE Cluster
resource "rancher2_cluster" "vsphere_oel_cluster" {
  name = "vsphere-oel-cluster"
  description = "vSphere Cluster based on Oracle Enterprise Linux"
  rke_config {
    network {
      plugin = "canal"
    }
    // cloud_provider {
    //     name = "vsphere"
    //     vsphere_cloud_provider {
    //         global {
    //             insecure_flag = true
    //         }
    //         virtual_center {
                
    //             name = var.vcenter_host
    //             user = var.vcenter_username
    //             password = var.vcenter_password
    //             port = 443
    //             datacenters = "/RNCH-HE-FMT"
                
    //         }
    //         workspace {
    //             server = var.vcenter_host
    //             folder = "/RNCH-HE-FMT/vm"
    //             default_datastore = "/RNCH-HE-FMT/ranch01-silo01-vm01"
    //             datacenter = "/RNCH-HE-FMT"
    //             resourcepool_path= "/RNCH-HE-FMT/FMT2.R620.1/mbh"
    //         }
    //     }
    // }
  }
}