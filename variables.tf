variable "agents" {
  description = <<EOT
Map of agents, attributes below
Required:
    - arch
    - os
Optional:
    - api_key_scope
    - auth
    - connection_timeout
    - dir
    - env
    - motd_file
    - order
    - shutdown_script
    - startup_script
    - startup_script_behavior
    - troubleshooting_url
    - display_apps (block):
        - port_forwarding_helper (optional)
        - ssh_helper (optional)
        - vscode (optional)
        - vscode_insiders (optional)
        - web_terminal (optional)
    - metadata (block):
        - display_name (optional)
        - interval (required)
        - key (required)
        - order (optional)
        - script (required)
        - timeout (optional)
    - resources_monitoring (block):
        - memory (optional, block):
            - enabled (required)
            - threshold (required)
        - volume (optional, block):
            - enabled (required)
            - path (required)
            - threshold (required)
EOT

  type = map(object({
    arch                    = string
    os                      = string
    api_key_scope           = optional(string)
    auth                    = optional(string)
    connection_timeout      = optional(number)
    dir                     = optional(string)
    env                     = optional(map(string))
    motd_file               = optional(string)
    order                   = optional(number)
    shutdown_script         = optional(string)
    startup_script          = optional(string)
    startup_script_behavior = optional(string)
    troubleshooting_url     = optional(string)
    display_apps = optional(object({
      port_forwarding_helper = optional(bool)
      ssh_helper             = optional(bool)
      vscode                 = optional(bool)
      vscode_insiders        = optional(bool)
      web_terminal           = optional(bool)
    }))
    metadata = optional(list(object({
      display_name = optional(string)
      interval     = number
      key          = string
      order        = optional(number)
      script       = string
      timeout      = optional(number)
    })))
    resources_monitoring = optional(object({
      memory = optional(object({
        enabled   = bool
        threshold = number
      }))
      volume = optional(list(object({
        enabled   = bool
        path      = string
        threshold = number
      })))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.agents : (
        v.api_key_scope == null || (contains(["all", "no_user_data"], v.api_key_scope))
      )
    ])
    error_message = "must be one of: \"all\", \"no_user_data\""
  }
  validation {
    condition = alltrue([
      for k, v in var.agents : (
        contains(["amd64", "armv7", "arm64"], v.arch)
      )
    ])
    error_message = "must be one of: \"amd64\", \"armv7\", \"arm64\""
  }
  validation {
    condition = alltrue([
      for k, v in var.agents : (
        v.auth == null || (contains(["token", "google-instance-identity", "aws-instance-identity", "azure-instance-identity"], v.auth))
      )
    ])
    error_message = "must be one of: \"token\", \"google-instance-identity\", \"aws-instance-identity\", \"azure-instance-identity\""
  }
  validation {
    condition = alltrue([
      for k, v in var.agents : (
        contains(["linux", "darwin", "windows"], v.os)
      )
    ])
    error_message = "must be one of: \"linux\", \"darwin\", \"windows\""
  }
  validation {
    condition = alltrue([
      for k, v in var.agents : (
        v.connection_timeout == null || (v.connection_timeout >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.agents : (
        v.startup_script_behavior == null || (contains(["blocking", "non-blocking"], v.startup_script_behavior))
      )
    ])
    error_message = "must be one of: \"blocking\", \"non-blocking\""
  }
  validation {
    condition = alltrue([
      for k, v in var.agents : (
        v.resources_monitoring == null || (v.resources_monitoring.memory == null || (v.resources_monitoring.memory.threshold >= 0 && v.resources_monitoring.memory.threshold <= 100))
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.agents : (
        v.resources_monitoring == null || (v.resources_monitoring.volume == null || alltrue([for item in v.resources_monitoring.volume : (item.threshold >= 0 && item.threshold <= 100)]))
      )
    ])
    error_message = "must be between 0 and 100"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

