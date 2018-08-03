terraform {
  backend "gcs" {
    bucket = "microservices-tf-backend"
    prefix = "terraform/tfstate/stage"
  }
}
