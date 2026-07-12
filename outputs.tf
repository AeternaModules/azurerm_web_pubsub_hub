output "web_pubsub_hubs_id" {
  description = "Map of id values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.id }
}
output "web_pubsub_hubs_anonymous_connections_enabled" {
  description = "Map of anonymous_connections_enabled values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.anonymous_connections_enabled }
}
output "web_pubsub_hubs_event_handler" {
  description = "Map of event_handler values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.event_handler }
}
output "web_pubsub_hubs_event_listener" {
  description = "Map of event_listener values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.event_listener }
}
output "web_pubsub_hubs_name" {
  description = "Map of name values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.name }
}
output "web_pubsub_hubs_web_pubsub_id" {
  description = "Map of web_pubsub_id values across all web_pubsub_hubs, keyed the same as var.web_pubsub_hubs"
  value       = { for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : k => v.web_pubsub_id }
}

