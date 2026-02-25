terraform {
  backend "gcs" {
    bucket  = "dharani-devops-tf-state"
    prefix  = "prod"
  }
}
