variable "mongodbatlas_public_key" {
  type    = string
  default = "idrywwhl"
}

variable "mongodbatlas_private_key" {
  type    = string
  default = "d566ce9b-36db-4fb3-acb6-6f07a98a856e"
}

variable "org_id" {
  type    = string
  default = "6165979e492a33660d3f1247"
}

variable "service_configuration" {
  default = {
    app1 = {
      serviceName     = "possums-data-store"
      mongoCluster    = "animals-mongo"
      mongoDatabase   = "marsupials-dev"
      mongoCollection = "possums"
      mongouser       = "dbadmin"
    },
    app2 = {
      serviceName     = "numbats-data-store"
      mongoCluster    = "animals-mongo"
      mongoDatabase   = "marsupials-dev"
      mongoCollection = "numbats"
      mongouser       = "adadmin"
    }
  }
}

locals {
  service_configuration = var.service_configuration
}
