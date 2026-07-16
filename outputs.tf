output "web_pubsub_hubs_id" {
  description = "Map of id values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "web_pubsub_hubs_anonymous_connections_enabled" {
  description = "Map of anonymous_connections_enabled values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.anonymous_connections_enabled if v.anonymous_connections_enabled != null }
}
output "web_pubsub_hubs_event_handler" {
  description = "Map of event_handler values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.event_handler if v.event_handler != null && length(v.event_handler) > 0 }
}
output "web_pubsub_hubs_event_listener" {
  description = "Map of event_listener values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.event_listener if v.event_listener != null && length(v.event_listener) > 0 }
}
output "web_pubsub_hubs_name" {
  description = "Map of name values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "web_pubsub_hubs_web_pubsub_id" {
  description = "Map of web_pubsub_id values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.web_pubsub_id if v.web_pubsub_id != null && length(v.web_pubsub_id) > 0 }
}

