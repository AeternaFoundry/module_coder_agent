output "agents_id" {
  description = "Map of id values across all agents, keyed the same as var.agents except keys with no id are omitted"
  value       = { for k, v in coder_agent.agents : k => v.id if v.id != null && length(v.id) > 0 }
}
output "agents_api_key_scope" {
  description = "Map of api_key_scope values across all agents, keyed the same as var.agents except keys with no api_key_scope are omitted"
  value       = { for k, v in coder_agent.agents : k => v.api_key_scope if v.api_key_scope != null && length(v.api_key_scope) > 0 }
}
output "agents_arch" {
  description = "Map of arch values across all agents, keyed the same as var.agents except keys with no arch are omitted"
  value       = { for k, v in coder_agent.agents : k => v.arch if v.arch != null && length(v.arch) > 0 }
}
output "agents_auth" {
  description = "Map of auth values across all agents, keyed the same as var.agents except keys with no auth are omitted"
  value       = { for k, v in coder_agent.agents : k => v.auth if v.auth != null && length(v.auth) > 0 }
}
output "agents_connection_timeout" {
  description = "Map of connection_timeout values across all agents, keyed the same as var.agents except keys with no connection_timeout are omitted"
  value       = { for k, v in coder_agent.agents : k => v.connection_timeout if v.connection_timeout != null }
}
output "agents_dir" {
  description = "Map of dir values across all agents, keyed the same as var.agents except keys with no dir are omitted"
  value       = { for k, v in coder_agent.agents : k => v.dir if v.dir != null && length(v.dir) > 0 }
}
output "agents_display_apps" {
  description = "Map of display_apps values across all agents, keyed the same as var.agents except keys with no display_apps are omitted"
  value       = { for k, v in coder_agent.agents : k => one(v.display_apps) if v.display_apps != null && length(v.display_apps) > 0 }
}
output "agents_env" {
  description = "Map of env values across all agents, keyed the same as var.agents except keys with no env are omitted"
  value       = { for k, v in coder_agent.agents : k => v.env if v.env != null && length(v.env) > 0 }
}
output "agents_init_script" {
  description = "Map of init_script values across all agents, keyed the same as var.agents except keys with no init_script are omitted"
  value       = { for k, v in coder_agent.agents : k => v.init_script if v.init_script != null && length(v.init_script) > 0 }
}
output "agents_metadata" {
  description = "Map of metadata values across all agents, keyed the same as var.agents except keys with no metadata are omitted"
  value       = { for k, v in coder_agent.agents : k => v.metadata if v.metadata != null && length(v.metadata) > 0 }
}
output "agents_motd_file" {
  description = "Map of motd_file values across all agents, keyed the same as var.agents except keys with no motd_file are omitted"
  value       = { for k, v in coder_agent.agents : k => v.motd_file if v.motd_file != null && length(v.motd_file) > 0 }
}
output "agents_order" {
  description = "Map of order values across all agents, keyed the same as var.agents except keys with no order are omitted"
  value       = { for k, v in coder_agent.agents : k => v.order if v.order != null }
}
output "agents_os" {
  description = "Map of os values across all agents, keyed the same as var.agents except keys with no os are omitted"
  value       = { for k, v in coder_agent.agents : k => v.os if v.os != null && length(v.os) > 0 }
}
output "agents_resources_monitoring" {
  description = "Map of resources_monitoring values across all agents, keyed the same as var.agents except keys with no resources_monitoring are omitted"
  value       = { for k, v in coder_agent.agents : k => one(v.resources_monitoring) if v.resources_monitoring != null && length(v.resources_monitoring) > 0 }
}
output "agents_shutdown_script" {
  description = "Map of shutdown_script values across all agents, keyed the same as var.agents except keys with no shutdown_script are omitted"
  value       = { for k, v in coder_agent.agents : k => v.shutdown_script if v.shutdown_script != null && length(v.shutdown_script) > 0 }
}
output "agents_startup_script" {
  description = "Map of startup_script values across all agents, keyed the same as var.agents except keys with no startup_script are omitted"
  value       = { for k, v in coder_agent.agents : k => v.startup_script if v.startup_script != null && length(v.startup_script) > 0 }
}
output "agents_startup_script_behavior" {
  description = "Map of startup_script_behavior values across all agents, keyed the same as var.agents except keys with no startup_script_behavior are omitted"
  value       = { for k, v in coder_agent.agents : k => v.startup_script_behavior if v.startup_script_behavior != null && length(v.startup_script_behavior) > 0 }
}
output "agents_token" {
  description = "Map of token values across all agents, keyed the same as var.agents except keys with no token are omitted"
  value       = { for k, v in coder_agent.agents : k => v.token if v.token != null && length(v.token) > 0 }
  sensitive   = true
}
output "agents_troubleshooting_url" {
  description = "Map of troubleshooting_url values across all agents, keyed the same as var.agents except keys with no troubleshooting_url are omitted"
  value       = { for k, v in coder_agent.agents : k => v.troubleshooting_url if v.troubleshooting_url != null && length(v.troubleshooting_url) > 0 }
}

