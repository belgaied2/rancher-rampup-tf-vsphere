terraform{
    backend "s3" {
        key = "%STATE_FILENAME%"
        bucket = "%S3_BUCKET_NAME%"
        region = "eu-central-1"            
    }
}