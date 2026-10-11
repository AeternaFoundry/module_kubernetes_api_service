output "api_services_id" {
  description = "Map of id values across all api_services, keyed the same as var.api_services except keys with no id are omitted"
  value       = { for k, v in kubernetes_api_service.api_services : k => v.id if v.id != null && length(v.id) > 0 }
}
output "api_services_metadata" {
  description = "Map of metadata values across all api_services, keyed the same as var.api_services except keys with no metadata are omitted"
  value       = { for k, v in kubernetes_api_service.api_services : k => one(v.metadata) if v.metadata != null && length(v.metadata) > 0 }
}
output "api_services_spec" {
  description = "Map of spec values across all api_services, keyed the same as var.api_services except keys with no spec are omitted"
  value       = { for k, v in kubernetes_api_service.api_services : k => one(v.spec) if v.spec != null && length(v.spec) > 0 }
}

