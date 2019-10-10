provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "test" {
  image    = docker_image.alpine-terraform.latest
  name     = "test"
  must_run = true

  volumes {
    container_path = "/tmp"
    host_path      = "/Users/ladmusician/tmp/terraform-docker/terraform"
  }

  command = [
    "/bin/sh", "-c", "/tmp/run-terraform.sh"
  ]
}

resource "docker_image" "alpine-terraform" {
  name = "alpine-terraform:0.1"
}
