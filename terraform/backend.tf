#sample s3 backend using DigitalOcean Spaces

terraform {

 backend "s3" {
    #bucket = "buckets3"   #< set the bucket name when you 1st init -migrate-state  no need to define it in the file
    key    = "terraform.tfstate"
    region = "auto"

    # pass the access/secret key as VARS, but copy them down when creating the bucket
    access_key = "DO801GSSSSSSS"
    secret_key = "iPVAkbSSSSSSSSSSSS"
    

    endpoints = {
      s3 = "https://sfo3.digitaloceanspaces.com"
    }

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true
  }
}
