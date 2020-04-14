# vCenter configuration variables
variable "vcenter_username" {
    default = ""

}

variable "vcenter_password" {
    default = ""
}

variable "vcenter_host" {
    default = ""
}

variable "vc_network" {
    default = ""
}

variable "vc_datacenter" {
    default = ""
}


variable "vc_resource_pool" {
    default = ""
}

variable "vc_datastore" {
    default = ""
}

variable "vm_template" {
    default = ""
}

# Rancher Server configuration variables
variable "rancher2_api_url" {
    default = ""
}

variable "rancher2_access_key" {
    default = ""
}

variable "rancher2_secret_key" {
    default = ""
}

# Node Configuration variables
variable "hostname_prefix" {
    default = ""
}

variable "hostname_suffix" {
    default = ""
}

variable "root_password" {
    default = "admin"
}
