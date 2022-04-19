# variables supplied from parent module

variable docker_host {}

variable container_name {
  default = "cadvisor"
}

variable container_version {
  default = "latest"
}

# send container logs to the systemd journal
# sudo journalctl -b CONTAINER_NAME=cadvisor --all
variable "log_driver" {
  default = "journald"
}

# docker provider - used to interact with docker containers and images via docker api (:2376) at configured host	
provider "docker" {
  host = "tcp://${var.docker_host}:2376"
}

# docker container lifecycle	
resource "docker_container" "cadvisor" {
  name       = var.container_name
  image      = docker_image.cadvisor.latest
  restart    = "unless-stopped"
  log_driver = var.log_driver

  ports {
    internal = 8080
    external = 8080
  }

  volumes {
    host_path      = "/"
    container_path = "/rootfs"
  }

  volumes {
    host_path      = "/var/run"
    container_path = "/var/run"
  }

  volumes {
    host_path      = "/sys/"
    container_path = "/sys"
  }

  volumes {
    host_path      = "/var/lib/docker/"
    container_path = "/var/lib/docker"
  }

  volumes {
    host_path      = "/dev/disk/"
    container_path = "/dev/disk"
  }
}

# docker image pulled from the public Google Container Registry	
resource "docker_image" "cadvisor" {
  name = "gcr.io/cadvisor/cadvisor:${var.container_version}"
}