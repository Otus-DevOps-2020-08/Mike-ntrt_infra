terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "devoptus-tfstate"
    region     = "us-east-1"
    access_key = "T_s_XIvQuN6vfzIjKkGc"
    secret_key = "1Ijl1qebhENWA4ByRhUzNzepMxB-zq8HHqukJmLT"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
