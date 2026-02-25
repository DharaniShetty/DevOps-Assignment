terraform {
  backend "gcs" {
    bucket  = "devops-assignment-tf-state"
    prefix  = "staging"
  }
}
