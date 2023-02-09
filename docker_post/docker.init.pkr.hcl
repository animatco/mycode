/* Packer Block - Contains Packer settings, including Packer version
                  as well as the required plugins. Anyone can write a plugin (GoLang)
                  Alta3 Research has an introduction to GoLang course (5 days) */
packer {
  required_plugins {
    // The Docker Builder (plugin) - built, maintained, and distributed by HashiCorp
    docker = {
      version = ">= 0.0.7"
      // only necessary when requiring a plugin outside the HashiCorp domain
      source = "github.com/hashicorp/docker"
    }
  }
}

