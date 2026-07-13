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
    anonymous_connections_enabled = optional(bool)
    event_handler = optional(list(object({
      auth = optional(object({
        managed_identity_id = string
      }))
      system_events      = optional(set(string))
      url_template       = string
      user_event_pattern = optional(string)
    })))
    event_listener = optional(list(object({
      eventhub_name            = string
      eventhub_namespace_name  = string
      system_event_name_filter = optional(list(string))
      user_event_name_filter   = optional(list(string))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.web_pubsub_hubs : (
        v.event_handler == null || alltrue([for item in v.event_handler : (length(item.url_template) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.web_pubsub_hubs : (
        v.event_handler == null || alltrue([for item in v.event_handler : (item.user_event_pattern == null || (length(item.user_event_pattern) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.web_pubsub_hubs : (
        v.event_handler == null || alltrue([for item in v.event_handler : (item.system_events == null || (alltrue([for x in item.system_events : contains(["connect", "connected", "disconnected"], x)])))])
      )
    ])
    error_message = "must be one of: connect, connected, disconnected"
  }
  validation {
    condition = alltrue([
      for k, v in var.web_pubsub_hubs : (
        v.event_handler == null || alltrue([for item in v.event_handler : (item.auth == null || (length(item.auth.managed_identity_id) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.web_pubsub_hubs : (
        v.event_listener == null || alltrue([for item in v.event_listener : (item.system_event_name_filter == null || (alltrue([for x in item.system_event_name_filter : contains(["connected", "disconnected"], x)])))])
      )
    ])
    error_message = "must be one of: connected, disconnected"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

