
data "vsphere_datacenter" "dc" {
  name = "RNCH-HE-FMT"
}

data "vsphere_datastore" "datastore" {
  name          = "ranch01-silo01-vm01"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "mbh"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "Private Range 172.16.128.1-21"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

module "rancher2_cluster" {
  source = "../tf-rancher2-vsphere"
  rancher2_api_url = var.rancher2_api_url
  rancher2_access_key = var.rancher2_access_key
  rancher2_secret_key = var.rancher2_secret_key
  vcenter_username = var.vcenter_username
  vcenter_host = var.vcenter_host
  vcenter_password = var.vcenter_password
}

resource "vsphere_virtual_machine" "vm" {
  
  count = 3

  name             = "mbh-conti-custom-node-${count.index}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 8192
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 20
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "root"
      password = var.root_password
      host     = self.default_ip_address
    }
      
    inline = [
      "hostname mbh-conti-${count.index}",
      "echo mbh-conti-${count.index}.mbh.internal",
      "${module.rancher2_cluster.node_command} --controlplane --etcd"
    ]
  }
}

resource "vsphere_virtual_machine" "worker-vms" {
  
  count = 3

  name             = "mbh-conti-custom-node-${count.index+3}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 8192
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 20
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "root"
      password = var.root_password
      host     = self.default_ip_address
    }
      
    inline = [
      "hostname mbh-conti-${count.index+3}",
      "echo mbh-conti-${count.index+3}.mbh.internal",
      "${module.rancher2_cluster.node_command} --worker"
    ]
  }
}