terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "custom" {
  filename = var.filename
  content = var.message
}

output "file_path" {
  value = local_file.custom.filename
}
