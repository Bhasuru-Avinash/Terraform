provider "docker" {
  # On Windows with Docker Desktop, use the default Unix socket through WSL
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name  = "my-nginx"
  image = docker_image.nginx.latest
   ports {
    internal = 80
    external = 8080
  }
}

