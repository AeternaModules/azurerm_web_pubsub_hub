resource "azurerm_web_pubsub_hub" "web_pubsub_hubs" {
  for_each = var.web_pubsub_hubs

  name                          = each.value.name
  web_pubsub_id                 = each.value.web_pubsub_id
  anonymous_connections_enabled = each.value.anonymous_connections_enabled

  dynamic "event_handler" {
    for_each = each.value.event_handler != null ? [each.value.event_handler] : []
    content {
      dynamic "auth" {
        for_each = event_handler.value.auth != null ? [event_handler.value.auth] : []
        content {
          managed_identity_id = auth.value.managed_identity_id
        }
      }
      system_events      = event_handler.value.system_events
      url_template       = event_handler.value.url_template
      user_event_pattern = event_handler.value.user_event_pattern
    }
  }

  dynamic "event_listener" {
    for_each = each.value.event_listener != null ? [each.value.event_listener] : []
    content {
      eventhub_name            = event_listener.value.eventhub_name
      eventhub_namespace_name  = event_listener.value.eventhub_namespace_name
      system_event_name_filter = event_listener.value.system_event_name_filter
      user_event_name_filter   = event_listener.value.user_event_name_filter
    }
  }
}

