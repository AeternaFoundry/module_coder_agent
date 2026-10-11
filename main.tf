resource "coder_agent" "agents" {
  for_each = var.agents

  arch                    = each.value.arch
  os                      = each.value.os
  api_key_scope           = each.value.api_key_scope
  auth                    = each.value.auth
  connection_timeout      = each.value.connection_timeout
  dir                     = each.value.dir
  env                     = each.value.env
  motd_file               = each.value.motd_file
  order                   = each.value.order
  shutdown_script         = each.value.shutdown_script
  startup_script          = each.value.startup_script
  startup_script_behavior = each.value.startup_script_behavior
  troubleshooting_url     = each.value.troubleshooting_url

  dynamic "display_apps" {
    for_each = each.value.display_apps != null ? [each.value.display_apps] : []
    content {
      port_forwarding_helper = display_apps.value.port_forwarding_helper
      ssh_helper             = display_apps.value.ssh_helper
      vscode                 = display_apps.value.vscode
      vscode_insiders        = display_apps.value.vscode_insiders
      web_terminal           = display_apps.value.web_terminal
    }
  }

  dynamic "metadata" {
    for_each = each.value.metadata != null ? each.value.metadata : []
    content {
      display_name = metadata.value.display_name
      interval     = metadata.value.interval
      key          = metadata.value.key
      order        = metadata.value.order
      script       = metadata.value.script
      timeout      = metadata.value.timeout
    }
  }

  dynamic "resources_monitoring" {
    for_each = each.value.resources_monitoring != null ? [each.value.resources_monitoring] : []
    content {
      dynamic "memory" {
        for_each = resources_monitoring.value.memory != null ? [resources_monitoring.value.memory] : []
        content {
          enabled   = memory.value.enabled
          threshold = memory.value.threshold
        }
      }
      dynamic "volume" {
        for_each = resources_monitoring.value.volume != null ? resources_monitoring.value.volume : []
        content {
          enabled   = volume.value.enabled
          path      = volume.value.path
          threshold = volume.value.threshold
        }
      }
    }
  }
}

