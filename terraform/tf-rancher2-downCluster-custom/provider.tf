provider "rancher2" {
    api_url    = var.rancher2_api_url
    access_key = var.rancher2_access_key
    secret_key = var.rancher2_secret_key
    insecure = true
}


provider "vsphere" {
  user           = var.vcenter_username
  password       = var.vcenter_password
  vsphere_server = var.vcenter_host

  # If you have a self-signed cert
  allow_unverified_ssl = true
  version = "1.15"
}