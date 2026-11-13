output "agents_id" {
  description = "Map of id values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.id }
}
output "agents_api_key_scope" {
  description = "Map of api_key_scope values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.api_key_scope }
}
output "agents_arch" {
  description = "Map of arch values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.arch }
}
output "agents_auth" {
  description = "Map of auth values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.auth }
}
output "agents_connection_timeout" {
  description = "Map of connection_timeout values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.connection_timeout }
}
output "agents_dir" {
  description = "Map of dir values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.dir }
}
output "agents_display_apps" {
  description = "Map of display_apps values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => one(v.display_apps) }
}
output "agents_env" {
  description = "Map of env values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.env }
}
output "agents_init_script" {
  description = "Map of init_script values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.init_script }
}
output "agents_metadata" {
  description = "Map of metadata values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.metadata }
}
output "agents_motd_file" {
  description = "Map of motd_file values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.motd_file }
}
output "agents_order" {
  description = "Map of order values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.order }
}
output "agents_os" {
  description = "Map of os values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.os }
}
output "agents_resources_monitoring" {
  description = "Map of resources_monitoring values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => one(v.resources_monitoring) }
}
output "agents_shutdown_script" {
  description = "Map of shutdown_script values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.shutdown_script }
}
output "agents_startup_script" {
  description = "Map of startup_script values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.startup_script }
}
output "agents_startup_script_behavior" {
  description = "Map of startup_script_behavior values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.startup_script_behavior }
}
output "agents_token" {
  description = "Map of token values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.token }
  sensitive   = true
}
output "agents_troubleshooting_url" {
  description = "Map of troubleshooting_url values across all agents, keyed the same as var.agents"
  value       = { for k, v in coder_agent.agents : k => v.troubleshooting_url }
}

