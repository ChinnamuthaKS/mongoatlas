## Create a Project
resource "mongodbatlas_project" "test" {
  name   = "Demo-project"
  org_id = var.org_id
}

output "test" {
  value = mongodbatlas_project.test
}

## Creating a shared cluster - Free tier 
resource "mongodbatlas_cluster" "animals_mongo" {
  project_id = mongodbatlas_project.test.id
  name       = "animals-mongo"

  # Provider Settings "block"
  provider_name               = "TENANT"
  backing_provider_name       = "AWS"
  provider_region_name        = "US_EAST_1"
  provider_instance_size_name = "M0"
}

## Generating a complex password to access the DB
resource "random_password" "db" {
  length           = 16
  special          = true
  override_special = "_%@"
}

## Creating a DB user with read permission
resource "mongodbatlas_database_user" "demo-mongo" {
  for_each           = var.service_configuration
  username           = each.value.mongouser
  password           = random_password.db1.result
  project_id         = mongodbatlas_project.test.id
  auth_database_name = "admin"

  roles {
    role_name     = "read"
    database_name = each.value.mongoDatabase
    collection_name = each.value.mongoCollection
  }
}

#output "cluster" {
#  value = mongodbatlas_cluster.animals_mongo
#}

#output "dbstring" {
#  value = mongodbatlas_cluster.animals_mongo.connection_strings[0].standard_srv
#}

