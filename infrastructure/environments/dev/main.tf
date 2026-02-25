provider "google" {
  project = "devops-assignment-dev"
  region  = "asia-south1"
}

resource "google_service_account" "cloud_run_sa" {
  account_id   = "cloud-run-dev-sa"
  display_name = "Cloud Run Dev Service Account"
}

resource "google_cloud_run_v2_service" "backend" {
  name     = "backend-dev"
  location = "asia-south1"

  template {
    service_account = google_service_account.cloud_run_sa.email

    containers {
      image = "asia-south1-docker.pkg.dev/devops-assignment-dev/backend-repo/backend-image:latest"

      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
      }

      env {
        name  = "ENV"
        value = "dev"
      }
    }

    scaling {
      min_instance_count = 0
      max_instance_count = 1
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
