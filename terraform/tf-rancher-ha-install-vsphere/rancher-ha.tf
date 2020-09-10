locals {
  name               = "rancher-ha"
  kubernetes_version = var.kubernetes_version
  rancher_hostname = var.rancher_hostname
}

# Module to prepare VMs on vSphere for RKE
module "rke_vms" {
  source = "github.com/belgaied2/tf-module-rke-infra-vsphere"
  vcenter_host = var.vcenter_host
  vcenter_username = var.vcenter_username
  vcenter_password = var.vcenter_password
  vm_template = var.vm_template
  private_key = var.private_key
  ssh_user = var.ssh_user
  vsphere_dc = var.vsphere_dc
  vsphere_ds = var.vsphere_ds
  vsphere_rp = var.vsphere_rp
  vsphere_net = var.vsphere_net
}

# RKE cluster
module "rke_cluster" {
  source = "github.com/rawmind0/tf-module-rke-cluster"
  rke_nodes = [
    for instance in module.rke_vms.ip_addresses :
    {
      public_ip = instance
      private_ip = instance
      hostname = "rancher-ha-${instance}"
      roles = ["controlplane","etcd","worker"]
      user = "rancher"
      ssh_key = file(var.private_key)
    }
  ]
    
  rke = {
    cluster_name = local.name
    dind = false
    kubernetes_version = local.kubernetes_version
  }
}

# Rancher server
module "rancher_server" {
  source = "github.com/rawmind0/tf-module-rancher-server"
  rancher_hostname = local.rancher_hostname
  rancher_k8s = {
    host = module.rke_cluster.kubeconfig_api_server_url
    client_certificate     = module.rke_cluster.kubeconfig_client_cert
    client_key             = module.rke_cluster.kubeconfig_client_key
    cluster_ca_certificate = module.rke_cluster.kubeconfig_ca_crt
  }
  
  
}
