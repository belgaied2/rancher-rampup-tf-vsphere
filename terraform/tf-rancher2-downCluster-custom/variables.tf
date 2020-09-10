variable "vcenter_host" {
    default = ""
}


variable "vcenter_username" {
    default = ""
}


variable "vcenter_password" {
    default = ""
}

variable "vm_template" {
    default = ""
}

variable "rancher2_api_url" {
    default = ""
}

variable "rancher2_access_key" {
    default = ""
}

variable "rancher2_secret_key" {
    default = ""
}


variable "private_key" {
  description = "path of private key for RKE nodes"
  default     = "/home/mohamed/.ssh/MacOSsKey.pem"
}


variable "vm_count" {
  description = "Number of VMs to spin up for RKE"
  default = 3
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

variable "vm_cpus" {
  description = "Number of CPUs to give to VM"
  default     = 2
}

variable "vm_mem" {
  description = "Memory size in MB for VM"
  default     = 8192
}

variable "vm_disk_size" {
  description = "Size in GB of the main VM's Disk"
  default     = 20
}

variable "vsphere_guest_id" {
  description = "Type of OS for Guest"
  default     = "rhel7_64Guest"
}

variable "ssh_user" {
  description = "SSH Username to connect to VM with"
}

variable "vm_name_prefix" {
  description = "Prefix for the VM name in vSphere"
  default     = "rancher-ha"
}


