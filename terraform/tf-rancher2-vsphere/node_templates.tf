
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
      datacenter = "RNCH-HE-FMT"
      datastore = "ranch01-silo01-vm01"
      disk_size = "40960"
      memory_size = "8192"
      ssh_password = "PackerBuilt!"
      ssh_user = "root"
      creation_type = "template"
      cloud_config = "runcmd:\n  - \"sudo systemctl stop firewalld.service\"\n  - \"sudo systemctl disabled firewalld.service\"\n  - \"sudo systemctl restart docker.service\""
  }
}