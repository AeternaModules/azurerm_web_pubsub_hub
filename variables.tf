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
    anonymous_connections_enabled = optional(bool) # Default: false
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
  validation {
    condition = alltrue([
      for k, v in var.web_pubsub_hubs : (
        v.event_handler == null || (length(v.event_handler.url_template) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.web_pubsub_hubs : (
        v.event_handler == null || (v.event_handler.user_event_pattern == null || (length(v.event_handler.user_event_pattern) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.web_pubsub_hubs : (
        v.event_handler == null || (v.event_handler.system_events == null || (contains(["connect", "connected", "disconnected"], v.event_handler.system_events)))
      )
    ])
    error_message = "must be one of: connect, connected, disconnected"
  }
  validation {
    condition = alltrue([
      for k, v in var.web_pubsub_hubs : (
        v.event_handler == null || (v.event_handler.auth == null || (length(v.event_handler.auth.managed_identity_id) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.web_pubsub_hubs : (
        v.event_listener == null || (v.event_listener.system_event_name_filter == null || (contains(["connected", "disconnected"], v.event_listener.system_event_name_filter)))
      )
    ])
    error_message = "must be one of: connected, disconnected"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_web_pubsub_hub's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.WebPubSubHubName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: event_listener.eventhub_namespace_name
  #   source:    eventhubValidate.ValidateEventHubNamespaceName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: event_listener.eventhub_name
  #   source:    eventhubValidate.ValidateEventHubName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
}

