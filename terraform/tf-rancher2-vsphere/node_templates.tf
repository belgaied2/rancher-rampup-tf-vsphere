
resource "rancher2_cloud_credential" "vsphere_creds" {
  name = "vSphere-cloud"
  description= "Credentials to vSphere to be used by Rancher2 server to access vSphere cloud resources"
  vsphere_credential_config {
    password =  var.vcenter_password
    username =  var.vcenter_username
    vcenter = var.vcenter_host
  }
}

resource "rancher2_node_template" "vsphere_nt" {
  name = "merck-demo-template"
  description = "Node Template on vSphere for creating VMs using CentOS Linux"
  cloud_credential_id = rancher2_cloud_credential.vsphere_creds.id
  vsphere_config{
      pool = "mbh"
      clone_from = var.vm_template
      network = ["Private Range 172.16.128.1-21"]
  }
}