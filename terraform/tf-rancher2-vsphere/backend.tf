terraform{
    backend "s3" {
        bucket = "rancher-mhassine-rampup"
        key = "mbh-merck-rancher2-vsphere.state"
        region = "eu-central-1"
    }
}