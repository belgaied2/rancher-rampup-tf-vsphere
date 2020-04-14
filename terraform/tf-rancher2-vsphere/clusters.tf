# Create a new rancher2 RKE Cluster
resource "rancher2_cluster" "vsphere_oel_cluster" {
  name = "vsphere-oel-cluster-notemplate"
  description = "vSphere Cluster based on Oracle Enterprise Linux"
  rke_config {
# Defining Calico as CNI
    network {
      plugin = "calico"
    }


# Adding vSphere as a Cloud Provider in K8S (provides Storage mostly)
    cloud_provider {
        name = "vsphere"
        vsphere_cloud_provider {
            global {
                insecure_flag = true
            }
            virtual_center {
# Values in here, could not be variabilized as that resulted in empty values (variables not evaluated)
# Rancher is investigating if this might be a bug                
                name = "%VCENTER_NAME%"
                user = "%VCENTER_USERNAME%"
                password = "%VCENTER_PASSWORD%"
                port = 443
                datacenters = "%VCENTER_DATACENTER%"        #full path
                
            }
            workspace {
                server = "%VCENTER_NAME%"
                folder = "%VCENTER_VM_FOLDER%"              #full path
                default_datastore = "%VCENTER_DATASTORE%"   #full path
                datacenter = "%VCENTER_DATACENTER%"         #full path
                resourcepool_path= "%VCENTER_ResPool"       #full path
            }
        }
    }
  }
  cluster_auth_endpoint {
      enabled = true
    }
}