resource "kubernetes_api_service" "api_services" {
  for_each = var.api_services


  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
  }

  spec {
    ca_bundle                = each.value.spec.ca_bundle
    group                    = each.value.spec.group
    group_priority_minimum   = each.value.spec.group_priority_minimum
    insecure_skip_tls_verify = each.value.spec.insecure_skip_tls_verify
    dynamic "service" {
      for_each = each.value.spec.service != null ? [each.value.spec.service] : []
      content {
        name      = service.value.name
        namespace = service.value.namespace
        port      = service.value.port
      }
    }
    version          = each.value.spec.version
    version_priority = each.value.spec.version_priority
  }
}

