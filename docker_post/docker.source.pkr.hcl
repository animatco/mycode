/* Source Block - Configures the builder plugin, which is invoked by the Build Block. In the following example,
                  the Builder TYPE is "docker", and the Builder NAME is "ubuntu". */
// source "TYPE" "NAME"
source "docker" "ubuntu" {
  image  = "${var.docker_image}" // updated to use a variable
  commit = true
}

/* Parallel Builds - For a parallel build, we need a SECOND source and to update build sources */

source "docker" "ubuntu-bionic" {
  image  = "ubuntu:bionic"
  commit = true
}
