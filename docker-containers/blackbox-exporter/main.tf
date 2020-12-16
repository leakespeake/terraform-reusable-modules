# variables supplied from root module
variable docker_host {}

variable container_name {}

variable container_version {
  default = "latest"
}

variable log_driver {
  default = "journald"
}

# docker provider - used to interact with docker containers and images via docker api (:2376) at configured host
provider "docker" {
  host    = "tcp://${var.docker_host}:2376/"
}

# docker hub data source for read-only container lookup
data "docker_registry_image" "blackbox-exporter" {
  name = "leakespeake78/docker:blackbox-exporter-0.17.0"
}

# docker image to be pulled from dockerhub via the "docker_registry_image" data source above
resource "docker_image" "blackbox-exporter" {
  name          = data.docker_registry_image.blackbox-exporter.name
  pull_triggers = [data.docker_registry_image.blackbox-exporter.sha256_digest]
}

# docker container lifecycle
resource "docker_container" "blackbox-exporter" {
  name       = var.container_name
  image      = docker_image.blackbox-exporter.latest

  ports {
    external = 9115
    internal = 9115
	ip		 = "0.0.0.0"
  }

  restart    = "unless-stopped"
  log_driver = var.log_driver
}