terraform{
    backend "s3" {
        bucket = "rancher-mhassine-rampup"
        key = "tf-rancher-ha-vsphere.tfstate"
        region = "eu-central-1"
    }
}