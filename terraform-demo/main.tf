terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "hello" {
  filename = "/app/hello.txt"
  content = "Hello Terraform!"
}


resource "local_file" "goodbye" {
  filename = "/app/goodbye.txt"
  content = "Goodbye, Terraform!"
  depends_on = [local_file.hello]
}

output "files" {
  value = [
    local_file.hello.filename,
    local_file.goodbye.filename
  ]
}
