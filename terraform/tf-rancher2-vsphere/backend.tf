terraform{
    backend "s3" {
        bucket = "%S3_BUCKET_NAME%"
        key = "%STATE_FILENAME%"
        region = "eu-central-1"
    }
}