terraform{
    backend "s3" {
        bucket = "rancher-mhassine-rampup"
        key = "mbh-conti-rancher2-vsphere-notemplate.state"
        region = "eu-central-1"
    }
}