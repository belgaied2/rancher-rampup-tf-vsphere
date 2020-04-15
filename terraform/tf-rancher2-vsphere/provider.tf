provider "rancher2" {
    api_url    = var.rancher2_api_url
    access_key = var.rancher2_access_key
    secret_key = var.rancher2_secret_key
    # insecure = true
    version = "1.8.3"
}