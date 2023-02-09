build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu",        // matches source "docker" "ubuntu" {}
    "source.docker.ubuntu-bionic", // added for parallel build 
  ]

  // Provisioner - Uses the "shell" provisioner to set the env var "ALTA"
  // and then write that, and a string, into the file example.txt
  provisioner "shell" {
    environment_vars = [
      "ALTA=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"The env var ALTA is set to $ALTA\" > example.txt",
    ]
  }
  // recall of a variable declared in a template uses {}
  provisioner "shell" {
    inline = ["echo The base image in use is ${var.docker_image}"]
  }

  /* post-processors have a range of functionality, here we are tagging
     the images we have created. Other uses might be pushing to a cloud repo */
  post-processor "docker-tag" {
    repository = "learn-packer"
    tags       = ["ubuntu-xenial", "packer-rocks"]
    only       = ["docker.ubuntu"]
  }

  post-processor "docker-tag" {
    repository = "learn-packer"
    tags       = ["ubuntu-bionic", "packer-rocks"]
    only       = ["docker.ubuntu-bionic"]
  }
}
