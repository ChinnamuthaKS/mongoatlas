output "dbstring" {
  value = mongodbatlas_cluster.animals_mongo.connection_strings[0].standard_srv
}

locals {
  standard_srv = split("://", "mongodb+srv://animals-mongo.goabj.mongodb.net")
}


output "connection_string1" {
  #value = format("%s://%s/%s/%s",local.standard_srv[0],local.standard_srv[1],var.service_configuration.app1.mongoDatabase,var.service_configuration.app1.mongoCollection)
  sensitive = true
  value = "${local.standard_srv[0]}://${var.service_configuration.app1.mongouser}:${random_password.db1.result}@${local.standard_srv[1]}/${var.service_configuration.app1.mongoDatabase}/${var.service_configuration.app1.mongoCollection}"
}

output "connection_stringr2" {
  #value = format("%s://%s/%s/%s",local.standard_srv[0],local.standard_srv[1],var.service_configuration.app1.mongoDatabase,var.service_configuration.app1.mongoCollection)
  sensitive = true
  value = "${local.standard_srv[0]}://${var.service_configuration.app2.mongouser}:${random_password.db1.result}@${local.standard_srv[1]}/${var.service_configuration.app2.mongoDatabase}/${var.service_configuration.app2.mongoCollection}"
}
