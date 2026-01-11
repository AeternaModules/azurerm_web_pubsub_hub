variable "web_pubsub_hubs" {
  description = <<EOT
Map of web_pubsub_hubs, attributes below
Required:
    - name
    - web_pubsub_id
Optional:
    - anonymous_connections_enabled
    - event_handler (block):
        - auth (optional, block):
            - managed_identity_id (required)
        - system_events (optional)
        - url_template (required)
        - user_event_pattern (optional)
    - event_listener (block):
        - eventhub_name (required)
        - eventhub_namespace_name (required)
        - system_event_name_filter (optional)
        - user_event_name_filter (optional)
EOT

  type = map(object({
    name                          = string
    web_pubsub_id                 = string
    anonymous_connections_enabled = optional(bool, false)
    event_handler = optional(object({
      auth = optional(object({
        managed_identity_id = string
      }))
      system_events      = optional(set(string))
      url_template       = string
      user_event_pattern = optional(string)
    }))
    event_listener = optional(object({
      eventhub_name            = string
      eventhub_namespace_name  = string
      system_event_name_filter = optional(list(string))
      user_event_name_filter   = optional(list(string))
    }))
  }))
}

