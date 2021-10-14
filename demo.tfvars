service_configuration = [
  {
    serviceName     = "possums-data-store"
    mongoCluster    = "animals-mongo"
    mongoDatabase   = "marsupials-dev"
    mongoCollection = ["possums"]
    mongouser       = "dbadmin"
  },
  {
    serviceName     = "numbats-data-store"
    mongoCluster    = "animals-mongo"
    mongoDatabase   = "marsupials-dev"
    mongoCollection = ["numbats"]
    mongouser       = "adadmin"
  }
]
