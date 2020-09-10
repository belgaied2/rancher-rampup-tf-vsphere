variable "vcenter_host" {
  description = "Hostname for vCenter's API"
}

variable "vcenter_username" {
  description = "username for vCenter"
}

variable "vcenter_password" {
  description = "password for vCenter"
}

variable "vm_template" {
  description = "Full Path of the VM Template in vSphere from which the VM will be cloned"
}

variable "private_key" {
  description = "path of private key for RKE nodes"
}


variable "kubernetes_version" {
  description = "Kubernetes Version"
  default     = "v1.18.6-rancher1-1"
}

variable "vsphere_dc" {
  description = "vSphere Datacenter to use to create VMs"
}

variable "vsphere_ds" {
  description = "vSphere Datastore to use to create VMs"
}

variable "vsphere_rp" {
  description = "vSphere Resource Pool to attribute the VMs to"
}

variable "vsphere_net" {
  description = "vSphere Network to attribute the VMs to"
}

variable "ssh_user" {
  description = "SSH Username to connect to VM with"
}

variable "rancher_hostname" {
  description = "Desired Hostname for Rancher Web App"
}

