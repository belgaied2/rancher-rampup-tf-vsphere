terraform{
    backend "s3" {
        key = "mbh-conti-vsphere.state"
        bucket = "rancher-mhassine-rampup"
        region = "eu-central-1"
    }
}