terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "web" {
  name = "terraform-test-web"
  image = docker_image.nginx.name

  ports {
    internal = 80
    external = 8080
  }
}
