
data "vsphere_datacenter" "dc" {
  name = var.vc_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vc_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vc_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vc_network
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
}

resource "vsphere_virtual_machine" "vm" {
  
  count = 3

  name             = "${var.hostname_prefix}-${count.index}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2                    # change as see fit
  memory   = 8192                 # change as see fit
  guest_id = "ubuntu64Guest"      # change as see fit

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
      "hostname ${var.hostname_prefix}-${count.index}",
      "echo ${var.hostname_prefix}-${count.index}.${hostname.suffix} > /etc/hostname",
      "${module.rancher2_cluster.node_command} --controleplane --etcd"
    ]
  }
}
