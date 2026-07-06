output "web_pubsub_hubs" {
  description = "All web_pubsub_hub resources"
  value       = azurerm_web_pubsub_hub.web_pubsub_hubs
}
output "web_pubsub_hubs_anonymous_connections_enabled" {
  description = "List of anonymous_connections_enabled values across all web_pubsub_hubs"
  value       = [for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : v.anonymous_connections_enabled]
}
output "web_pubsub_hubs_event_handler" {
  description = "List of event_handler values across all web_pubsub_hubs"
  value       = [for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : v.event_handler]
}
output "web_pubsub_hubs_event_listener" {
  description = "List of event_listener values across all web_pubsub_hubs"
  value       = [for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : v.event_listener]
}
output "web_pubsub_hubs_name" {
  description = "List of name values across all web_pubsub_hubs"
  value       = [for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : v.name]
}
output "web_pubsub_hubs_web_pubsub_id" {
  description = "List of web_pubsub_id values across all web_pubsub_hubs"
  value       = [for k, v in azurerm_web_pubsub_hub.web_pubsub_hubs : v.web_pubsub_id]
}

