locals {
  workspace_ports = {
    "default" : 8080,
    "staging" : 8081,
  }
}

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_container" "nginx" {
  image = "nginx:latest"
  name = "web_server-${terraform.workspace}"
  ports {
    internal = 80
    external = local.workspace_ports[terraform.workspace]
  }
}
