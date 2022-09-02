terraform {
  required_version = ">= 1.2.6"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.20.3"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
