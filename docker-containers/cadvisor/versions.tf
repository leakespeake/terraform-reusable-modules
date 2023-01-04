terraform {
  required_providers {
    # Recommended to pin the specific version of the Docker Provider as new versions are released often
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.24.0"
    }
  }
  required_version = ">= 1.3.4"
}