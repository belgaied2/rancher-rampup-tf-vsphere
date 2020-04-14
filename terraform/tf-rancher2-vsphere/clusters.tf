# Create a new rancher2 RKE Cluster
resource "rancher2_cluster" "vsphere_oel_cluster" {
  name = "vsphere-oel-cluster-notemplate"
  description = "vSphere Cluster based on Oracle Enterprise Linux"
  rke_config {
    network {
      plugin = "calico"
    }
    
    cloud_provider {
        name = "vsphere"
        vsphere_cloud_provider {
            global {
                insecure_flag = true
            }
            virtual_center {
                
                name = "wrangler.fremont.rancherlabs.com"
                user = "mbelgaied-hassine"
                password = "fioj209902jns09ih092j90d90jsj90"
                port = 443
                datacenters = "/RNCH-HE-FMT"
                
            }
            workspace {
                server = "wrangler.fremont.rancherlabs.com"
                folder = "/RNCH-HE-FMT/vm"
                default_datastore = "/RNCH-HE-FMT/ranch01-silo01-vm01"
                datacenter = "/RNCH-HE-FMT"
                resourcepool_path= "/RNCH-HE-FMT/FMT2.R620.1/mbh"
            }
        }
    }
  }
  cluster_auth_endpoint {
      enabled = true
    }
}